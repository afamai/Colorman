package  {
	
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import flash.display3D.IndexBuffer3D;
	
	public class Level5 extends MovieClip
	{
		private var collisions:Array = new Array;
		
		public function Level5() 
		{
			p4.setMove(C.LEFT, 5, 333.35);
			cp1.setColor(C.BLUE);
			for(var j:int = 1; j <= 8; j++)
			{
				this["s"+j].attach(p4);
				collisions.push(this["s"+j]);
			}
			for(var i:int = 1; i <= 12; i++)
			{
				var plat = this["p"+i];
				if(i >= 7)
				{
					plat.setColor(C.BLUE);
				}
				collisions.push(plat);
			}
			collisions.push(cp1, portal);
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