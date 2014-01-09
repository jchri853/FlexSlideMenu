package  events
{
	import flash.events.Event;
	
	public class SelectedMenuItemEvent extends Event
	{
		public static const SELECTEDITEMCHANGE:String="SELECTEDITEMCHANGE";
		public var selectedMenuItem:String;
		public function SelectedMenuItemEvent(type:String, selectedMenuItem:String)
		{
			super(type, bubbles, cancelable);
			this.selectedMenuItem =  selectedMenuItem;
		}
		override public function clone():Event
		{
			return new SelectedMenuItemEvent(type,selectedMenuItem);
		}
	}
}


	
