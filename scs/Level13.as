package  {
	
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	
	public class Level13 extends BaseLevel
	{
		public function Level13() 
		{
			var time = 4000;
			c1.settings(C.LEFT, -3, time);
			c2.settings(C.RIGHT, 3, time);
			p10.setMove(C.UP, -3, 327);
			cp1.setColor(C.ORANGE);
			p9.setColor(C.ORANGE);
			for(var i:int = 1; i <= 10; i++)
			{
				collisions.push(this["p"+i]);
			}
			for(var j:int = 1; j <= 16; j++)
			{
				collisions.push(this["s"+j]);
			}
			collisions.push(g1,cp1,c1,c2,portal);
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