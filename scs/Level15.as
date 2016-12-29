package  {
	
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	
	public class Level15 extends BaseLevel
	{
		public function Level15() 
		{
			for(var r:int = 0; r < 2; r++)
			{
				var plat = 23+r;
				for(var s:int = 1; s <= 8; s++)
				{
					var spike = s+r*8;
					this["s"+spike].attach(this["p"+plat]);
				}
			}
			for(var c:int = 0; c < 4; c++)
			{
				plat = 19+c;
				for(var v:int = 25; v <= 28; v++)
				{
					spike = v+c*4;
					this["s"+spike].attach(this["p"+plat]);
				}
			}
			p19.setMove(C.RIGHT,3,100);
			p20.setMove(C.DOWN,3,90);
			p21.setMove(C.LEFT,-3,100);
			p22.setMove(C.UP,-3,90);
			p23.setMove(C.DOWN,5,335);
			p24.setMove(C.DOWN,5,335);
			
			p8.setColor(C.RED);
			p10.setColor(C.BLUE);
			p11.setColor(C.GREEN);
			p12.setColor(C.ORANGE);
			cp1.setColor(C.RED);
			cp2.setColor(C.BLUE);
			cp3.setColor(C.GREEN);
			cp4.setColor(C.ORANGE);
			
			for (var i:int = 1; i <= 40; i++)
			{
				collisions.push(this["s"+i]);
			}
			for (var j:int = 1; j <= 28; j++)
			{
				collisions.push(this["p"+j]);
			}
			collisions.push(portal,cp1,cp2,cp3,cp4);
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