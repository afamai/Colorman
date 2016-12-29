package  
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class BaseMenu extends MovieClip
	{
		public var loadNext:BaseMenu;
		public var stageRef:Stage;
		
		public function unload(nextMenu:BaseMenu = null):void
		{
			if (nextMenu != null)
			{
				loadNext = nextMenu;
			}
			remove();
		}
		public function remove()
		{
			if(stageRef.contains(this))
			{
				stageRef.removeChild(this);
			}
			if(loadNext != null)
			{
				loadNext.load();
			}
		}
		public function load()
		{
			stageRef.addChild(this);
		}
	}
	
}
