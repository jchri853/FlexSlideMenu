package  events
{
    import flash.events.Event;
    
    public class PanelSlideEvent extends Event
    {
        public static const PANELSLIDECHANGE:String="PANELSLIDECHANGE";
        public var position:String;
        public function PanelSlideEvent(type:String, position:String)
        {
            super(type, bubbles, cancelable);
            this.position =  position;
        }
        override public function clone():Event
        {
            return new PanelSlideEvent(type,position);
        }
    }
}



