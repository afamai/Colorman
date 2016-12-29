package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	public class MySlider extends MovieClip {
		
		public var maximum:Number = 100;
		public var minimum:Number = 0;
		private var value:Number;
		public function MySlider() {
			knob.buttonMode = true;
			knob.addEventListener(MouseEvent.MOUSE_DOWN, pressed);
			parent.addEventListener(MouseEvent.MOUSE_UP, released);
			track.addEventListener(MouseEvent.CLICK, clicked);
		}
		public function clicked(evt:MouseEvent)
		{
			knob.x = evt.stageX-x;			
			refreshValue();
		}
		public function released(evt:MouseEvent)
		{
			knob.stopDrag();
			value = (knob.x/width * (maximum-minimum))/100;
			removeEventListener(Event.ENTER_FRAME, refreshValue);
		}
		private function pressed(evt:MouseEvent)
		{
			knob.startDrag(false, new Rectangle(0,0,track.width,0));
			addEventListener(Event.ENTER_FRAME, refreshValue);
		}
		public function refreshValue(evt:Event=null)
		{
			value = (knob.x/width * (maximum-minimum))/100;
			if(this.name == "musicSlider")
			{
				GameSound.changeMusicVolume(value);
			}
			else
			{
				GameSound.changeSoundVolume(value);
			}
			
		}
		public function setValue(newVal:Number)
		{
			value = newVal;
			knob.x = (value*track.width);
		}
		public function getValue()
		{
			return int(value*100)/100;
		}
	}
	
}
