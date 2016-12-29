package  {
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	public class Congratz extends BaseMenu {
		
		public function Congratz(stageRef:Stage) {
			this.stageRef = stageRef;
			menuBtn.addEventListener(MouseEvent.CLICK, mainMenu);
		}
		public function mainMenu(evt:MouseEvent){
			GameSound.playSound(new Click());
			unload(new MainMenu(stageRef));
		}
								  
	}
	
}
