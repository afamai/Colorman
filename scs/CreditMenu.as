package  {
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class CreditMenu extends BaseMenu {
		
		
		public function CreditMenu(stageRef:Stage)
		{
			this.stageRef = stageRef;
			returnBtn.addEventListener(MouseEvent.CLICK, mainmenu)
		}
		public function mainmenu(e:MouseEvent)
		{
			GameSound.playSound(new Click());
			unload(new MainMenu(stageRef));
		}
	}
	
}
