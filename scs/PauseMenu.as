package  {
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class PauseMenu extends BaseMenu {
		
		private var controller:Controller;
		public function PauseMenu(control:Controller=null, stageRef:Stage = null) 
		{
			controller = control;
			this.stageRef = stageRef;
			returnBtn.addEventListener(MouseEvent.MOUSE_DOWN, goBack);
			mainMenuBtn.addEventListener(MouseEvent.MOUSE_DOWN, main);
			optionsBtn.addEventListener(MouseEvent.MOUSE_DOWN, options);
		}
		public function main(evt:MouseEvent)
		{
			GameSound.transition(new MiningByMoonlight());
			GameSound.playSound(new Click());
			controller.removeCurrentLevel();
			unload(new MainMenu(stageRef));
			remove();
		}
		public function options(evt:MouseEvent)
		{
			GameSound.playSound(new Click());
			unload(new OptionMenu(stageRef, controller))
		}
		public function goBack(evt:MouseEvent)
		{
			GameSound.playSound(new Click());
			controller.resume();
			remove();
		}
	}
	
}
