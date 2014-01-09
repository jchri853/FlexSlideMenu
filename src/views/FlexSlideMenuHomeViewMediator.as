package views
{
	import com.greensock.TweenLite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TransformGestureEvent;
	import spark.events.IndexChangeEvent;
	import events.PanelSlideEvent;
	import events.SelectedMenuItemEvent;
	import org.robotlegs.mvcs.Mediator;

	
	public class FlexSlideMenuHomeViewMediator extends Mediator
	{
		
		[Inject]
		public var view:FlexSlideMenuHomeView
		
		[Bindable]
		public var slidingPanelState:String = "normal";
		
	
		private var refreshTime:String;
		
		public function FlexSlideMenuHomeViewMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{

			eventMap.mapListener(view.menuBtn, MouseEvent.CLICK, menuBtnClick);
			eventMap.mapListener(view.nav, TransformGestureEvent.GESTURE_SWIPE, handleSwipe);
            eventMap.mapListener(view.menuList, Event.CHANGE, selectMenuItem, IndexChangeEvent);
            addContextListener(SelectedMenuItemEvent.SELECTEDITEMCHANGE, menuSelected);


		}
	
		
		protected function menuBtnClick(event:MouseEvent):void
		{
			if (slidingPanelState == 'normal')
			{
				openPanel();
			}
			else if (slidingPanelState == 'opening')
			{
				closePanel();
			}
		}
		
		//On last sweep dispatch to push in a new view
		private function lineSweep3():void
		{
			view.nav.x = 0;
			slidingPanelState = 'normal';
		}
		
		private function handleSwipe(event:TransformGestureEvent):void
		{
			// Swipe was to the right
			if (event.offsetX == 1)
			{
				// push the PreviousView without any data using default
				if (slidingPanelState == 'normal')
				{
					openPanel();
				}
			}
			else
			{
				closePanel();
				
			}
		}
		
		public function openPanel():void
		{
			slidingPanelState = 'opening';
		
			TweenLite.to(view.nav, 0.3, {x: 270, y: 0});
			dispatch(new events.PanelSlideEvent(PanelSlideEvent.PANELSLIDECHANGE, "Open"));
		}
		
		public function closePanel():void
		{
			slidingPanelState = 'normal';
			TweenLite.to(view.nav, 0.3, {x: 0, y: 0, onComplete: lineSweep3});
			dispatch(new events.PanelSlideEvent(PanelSlideEvent.PANELSLIDECHANGE, "Close"));
		
		}
        
        //Upon menu item selection dispatch a selectedMenuItem Event
        private function selectMenuItem(event:IndexChangeEvent):void
        {
          dispatch(new  events.SelectedMenuItemEvent(SelectedMenuItemEvent.SELECTEDITEMCHANGE, view.menuList.selectedItem.name));
        }

		
		
		//Upon recieving the event of a new menu slection - slide the view and show the name of the current target selected
		private function menuSelected(event:SelectedMenuItemEvent):void
		{
            closePanel();
            view.labelDisplay.text = event.selectedMenuItem.toString();
		}
		

	}
}

