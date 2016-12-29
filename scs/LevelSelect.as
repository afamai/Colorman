package  {
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.SimpleButton;
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	public class LevelSelect extends BaseMenu
	{
		
		
		public function LevelSelect(stageRef:Stage = null) 
		{
			this.stageRef = stageRef;
			returnBtn.addEventListener(MouseEvent.CLICK, mainmenu);
			for(var i:int = 1; i <= C.LEVEL_AMOUNT; i++)
			{
				this["level"+i].addEventListener(MouseEvent.CLICK, startLevel);
			}
		}
		private function startLevel(evt:MouseEvent)
		{
			GameSound.playSound(new Click());
			for(var i:int = 1; i <= C.LEVEL_AMOUNT; i++)
			{
				if(evt.currentTarget == this["level"+i])
					C.levelSelected = i;
			}
			//GameSound.transition(new Sound(new URLRequest("Chipper Doodle v2.mp3")));
			GameSound.transition(new ChipperDoodlev2());
			unload(new TransitionPanel(stageRef,C.levelSelected));
		}
		private function mainmenu(evt:MouseEvent)
		{
			GameSound.playSound(new Click());
			unload(new MainMenu(stageRef));
		}
	}
	
}
