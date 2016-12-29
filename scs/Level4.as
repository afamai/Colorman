package  {
	
	import flash.display.MovieClip;
	
	public class Level4 extends BaseLevel
	{
		public function Level4() 
		{
			for(var i:int = 1; i <= 12; i++)
			{
				collisions.push(this["s"+i]);
			}
			for(var j:int = 1; j <= 9; j++)
			{
				collisions.push(this["p"+j]);
			}
			collisions.push(portal,g1);
			
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