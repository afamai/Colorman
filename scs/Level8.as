package  {
	
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	
	public class Level8 extends BaseLevel
	{
		public function Level8() 
		{
			
			for (var i:int = 1; i <= 64; i++)
			{
				collisions.push(this["s"+i]);
			}
			for (var j:int = 1; j <= 36; j++)
			{
				collisions.push(this["p"+j]);
			}
			
			for(var r:int = 0; r < 8; r++)
			{
				var plat = 23+r;
				if(plat%2 == 0)
					this["p"+plat].setMove(C.UP,-7,328);
				else
					this["p"+plat].setMove(C.DOWN,7,328);
				for(var s:int = 1; s <= 8; s++)
				{
					var spike = s+r*8;
					this["s"+spike].attach(this["p"+plat]);
				}
			}
			
			collisions.push(portal);
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