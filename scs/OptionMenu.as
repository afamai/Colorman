package 
{

	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.events.Event;
	public class OptionMenu extends BaseMenu
	{
		private var controller:Controller;
		public function OptionMenu(stageRef:Stage = null, controller:Controller=null)
		{
			musicSlider.setValue(GameSound.musicVolume);
			soundSlider.setValue(GameSound.soundVolume);
			this.controller = controller;
			this.stageRef = stageRef;
			returnBtn.addEventListener(MouseEvent.CLICK, goBack);
		}
		public function goBack(evt:MouseEvent)
		{
			GameSound.playSound(new Click());
			if (controller == null)
			{
				unload(new MainMenu(stageRef));
			}
			else
			{
				unload(new PauseMenu(controller,stageRef));
			}
			//musicSlider.removeEventListener(Event.ENTER_FRAME, changeVolume);
			//soundSlider.removeEventListener(Event.ENTER_FRAME,changeVolume);
		}
		
	}
}