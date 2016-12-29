package  
{
	import flash.display.MovieClip;
	
	public class Level1 extends BaseLevel
	{
		public function Level1() 
		{
			collisions.push(p1,p2,p3,p4,portal);
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
