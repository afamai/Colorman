package  {
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	public class MainMenu extends BaseMenu {
		
		
		public function MainMenu(stageRef:Stage)
		{
			this.stageRef = stageRef;
			optionBtn.addEventListener(MouseEvent.CLICK, option);
			playBtn.addEventListener(MouseEvent.CLICK, playGame);
			creditsBtn.addEventListener(MouseEvent.CLICK, credits);
		}
		public function option(evt:MouseEvent)
		{
			GameSound.playSound(new Click());
			unload(new OptionMenu(stageRef));
		}
		public function playGame(evt:MouseEvent)
		{
			GameSound.playSound(new Click());
			unload(new LevelSelect(stageRef));
		}
		public function credits(evt:MouseEvent)
		{
			GameSound.playSound(new Click());
			unload(new CreditMenu(stageRef));
		}
	}
	
}
