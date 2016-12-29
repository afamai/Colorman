package  {
	
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	
	public class Level3 extends BaseLevel
	{
		public function Level3() 
		{
			for (var i:int = 1; i <= 23; i++)
			{
				collisions.push(this["s"+i]);
			}
			for (var j:int = 1; j <= 6; j++)
			{
				collisions.push(this["p"+j]);
			}
			collisions.push(portal);
		}
		public function getPlayer():Player
		{
			return player;
		}
		public function getPauseBtn():PauseButton
		{
			return pauseBtn;
		}
		public function getCollisions():Array
		{
			return collisions;
		}
	}
	
}