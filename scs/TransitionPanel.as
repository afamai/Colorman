package  {
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class TransitionPanel extends BaseMenu {
		
		public function TransitionPanel(stageRef:Stage, level:int=0) 
		{
			levelName.appendText(level.toString());
			this.stageRef = stageRef;
			this.stageRef.addEventListener(MouseEvent.CLICK, nextLevel);
		}
		private function nextLevel(evt:MouseEvent)
		{
			this.stage.dispatchEvent(new Event("gameStart"));
			this.stageRef.removeEventListener(MouseEvent.CLICK, nextLevel);
			remove();
		}
	}
}