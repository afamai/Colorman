package  
{
	import flash.display.MovieClip;
	
	public class Level11 extends BaseLevel
	{
		public function Level11() 
		{
			var delay:int = 2500;
			var projSpeed:int = 4;
			var platSpeed:int = 3;
			
			for(var i:int = 1; i <= 26; i++)
			{
				collisions.push(this["p"+i]);
			}
			cp1.setColor(C.RED);
			cp2.setColor(C.PURPLE);
			cp3.setColor(C.BLUE);
			cp4.setColor(C.ORANGE);
			p5.setColor(C.RED);
			p6.setColor(C.PURPLE);
			p9.setColor(C.PURPLE);
			p10.setColor(C.BLUE);
			p11.setColor(C.BLUE);
			p12.setColor(C.ORANGE);
			p15.setColor(C.ORANGE);
			p17.setMove(C.LEFT,-platSpeed, 350);
			p18.setMove(C.UP,-platSpeed, 243);
			p19.setMove(C.RIGHT,platSpeed, 350);
			p20.setMove(C.DOWN,platSpeed, 243);
			c1.settings(C.RIGHT, projSpeed, delay);
			c2.settings(C.DOWN, projSpeed, delay);
			c3.settings(C.LEFT, -projSpeed, delay);
			c4.settings(C.UP, -projSpeed, delay);
			c1.attach(p20);
			c2.attach(p17);
			c3.attach(p18);
			c4.attach(p19);
			collisions.push(c1,c2,c3,c4,cp1,cp2,cp3,cp4,portal);
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
