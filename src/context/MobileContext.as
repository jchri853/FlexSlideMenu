package context
{
	import org.robotlegs.mvcs.Context;
	import views.*;
    import events.*;



	public class MobileContext extends Context
	{
		
	    override public function startup():void
		{
		    //injector mapping
			injector.mapSingleton(SelectedMenuItemEvent);
            injector.mapSingleton(PanelSlideEvent);

	
			mediatorMap.mapView(FlexSlideMenuHomeView, FlexSlideMenuHomeViewMediator);

		}
	}
}


