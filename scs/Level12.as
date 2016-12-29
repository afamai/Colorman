package  {
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	
	public class Level12 extends BaseLevel
	{
		public function Level12() 
		{
			p14.setMove(C.DOWN, 3, 350);
			p15.setMove(C.UP, -6, 350);
			cp1.setColor(C.BLUE);
			cp2.setColor(C.RED);
			cp3.setColor(C.BLUE);
			cp4.setColor(C.RED);
			collisions.push(cp1,cp2,cp3, cp4, g1, portal);
			for(var j:int = 1; j <= 26; j++)
			{
				if( j <= 8)
				{
					this["s"+j].attach(p15);
				}
				else if( j >= 9 && j <= 16)
				{
					this["s"+j].attach(p14);
				}
				collisions.push(this["s"+j]);
			}
			for(var i:int = 1; i <= 23; i++)
			{
				if( i >= 8 && i <= 13 || i == 23)
				{
					this["p"+i].setColor(C.RED);
					
				}
				else if(i >= 17)
				{
					this["p"+i].setColor(C.BLUE);
				}
				collisions.push(this["p"+i]);
			
			}
			
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