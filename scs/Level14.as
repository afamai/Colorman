package  {
	
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	
	public class Level14 extends BaseLevel
	{
		public function Level14() 
		{
			p10.setMove(C.LEFT, -4, 453);
			c1.settings(C.RIGHT, 4, 2000);
			p7.setMove(C.UP, -5, 180);
			for(var j:int = 1; j <= 38; j++)
			{
				collisions.push(this["s"+j]);
			}
			for(var i:int = 1; i <= 10; i++)
			{
				if(i<=8)
					this["s"+i].attach(p10);
				collisions.push(this["p"+i]);
			}
			collisions.push(p1,p2,p3,p4,p5,p6,portal);
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