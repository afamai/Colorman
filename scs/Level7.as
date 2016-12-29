package  {
	
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	
	public class Level7 extends BaseLevel
	{
		public function Level7() 
		{
			p7.setColor(C.GREEN);
			p11.setColor(C.RED);
			p12.setColor(C.GREEN);
			p13.setColor(C.GREEN);
			cp1.setColor(C.RED);
			cp2.setColor(C.GREEN);
			c1.settings(C.DOWN, 3, 3000);
			c2.settings(C.RIGHT, 5, 2000);
			for(var i = 1 ; i <= 13; i++)
			{
				collisions.push(this["p"+i]);
			}
			collisions.push(g1,cp1,cp2,portal);
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