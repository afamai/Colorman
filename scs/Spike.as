package 
{
	import flash.display.MovieClip;

	public class Spike extends BaseObject
	{
		private var dir:int;
		private var speed:int;
		private var proj:Boolean;

		public function Spike()
		{
			super();
			proj = false;
		}
		public function setPosition(xPos:int, yPos:int)
		{
			x = xPos;
			y = yPos;
		}
		public function projectile(dir:int, speed:int)
		{
			this.dir = dir;
			this.speed = speed;
			proj = true;
		}
		public function kill()
		{
			var myStage:BaseLevel = parent as BaseLevel;
			myStage.removeCollision(this);
			myStage.removeChild(this);
			proj = false;
		}
		override public function update()
		{
			super.update();
			if (proj)
			{
				if (y-C.PROJECTILE_HEIGHT >= C.STAGE_HEIGHT || y+C.PROJECTILE_HEIGHT <= 0 || 
				   x-C.PROJECTILE_HEIGHT >= C.STAGE_WIDTH || x+C.PROJECTILE_HEIGHT <= 0 && !getGoThrough())
				{
					kill();
				}
				if (dir == C.UP || dir == C.DOWN)
				{
					y +=  speed;
				}
				else if (dir == C.LEFT || dir == C.RIGHT)
				{
					x +=  speed;
				}

			}
		}
	}

}