package  {
	
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import flash.display3D.IndexBuffer3D;
	
	public class Level6 extends BaseLevel
	{
		public function Level6() 
		{
			cp1.setColor(C.PURPLE);
			p14.setColor(C.PURPLE);
			p15.setMove(C.UP, -4, 167);
			p16.setMove(C.UP, -5, 262);
			for(var i:int = 1; i <= 16; i++)
			{
				var spike = this["s"+i];
				if(i <= 8)
				{
					spike.attach(p15);
				}
				else
				{
					spike.attach(p16);
				}
				collisions.push(spike);
			}
			for(var j:int = 1; j <= 16; j++)
			{
				collisions.push(this["p"+j]);
			}
			collisions.push(cp1,portal);
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