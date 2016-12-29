package  {
	
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	
	public class Level2 extends BaseLevel
	{
		public function Level2() 
		{
			p6.setMove(C.RIGHT,3,260);
			collisions = [p1,p2,p3,p4,p5,p6,p7,p8,portal];
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
