package  {
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	
	public class Level10 extends BaseLevel
	{
		public function Level10() 
		{
			c1.settings(C.LEFT,-5,2500,false);
			c2.settings(C.LEFT,-7,2000,false);
			c3.settings(C.RIGHT,6,3000,false);
			c4.settings(C.RIGHT,9,1500,false);
			c5.settings(C.LEFT, -7, 1500, false);
			c6.settings(C.RIGHT, 7, 1500, false);
			c7.settings(C.LEFT, -7, 1500, false);
			c8.settings(C.LEFT, -8, 2000, false);
			c9.settings(C.LEFT, -6, 2500, false);
			c10.settings(C.RIGHT, 7, 1750, false);
			c11.settings(C.RIGHT, 5, 2250, false);
			cp1.setColor(C.RED);
			p18.setColor(C.RED);
			cp2.setColor(C.GREEN);
			p17.setColor(C.GREEN);
			cp3.setColor(C.BLUE);
			p19.setColor(C.GREEN);
			for(var i:int = 1; i <= 24; i++)
			{
				collisions.push(this["p"+i]);
			}
			for(var j:int = 1; j <= 11; j++)
			{
				collisions.push(this["c"+j]);
			}
			collisions.push(cp1,cp2,cp3,portal);
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