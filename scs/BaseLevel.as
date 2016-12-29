package  
{
	import flash.display.MovieClip;
	public class BaseLevel extends MovieClip
	{
		protected var collisions:Array;
		public function BaseLevel()
		{
			collisions = new Array();
		}
		public function addCollision(obj:BaseObject)
		{
			collisions.push(obj);
		}
		public function removeCollision(obj:BaseObject)
		{
			var index:int = collisions.indexOf(obj);
			if(index >= 0)
				collisions.splice(index,1);
		}
	}
	
}
