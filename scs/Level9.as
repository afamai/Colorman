package  {
	
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	
	public class Level9 extends BaseLevel
	{
		public function Level9() 
		{
			p5.setMove(C.RIGHT,3,216);
			p10.setMove(C.LEFT,-3,216);
			for (var i:int = 1; i <= 52; i++)
			{
				collisions.push(this["s"+i]);
			}
			for (var j:int = 1; j <= 12; j++)
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