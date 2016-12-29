package  {
	import flash.display.MovieClip;
	
	public class BaseObject extends MovieClip
	{
		private var platform:Platform;
		private var goThrough:Boolean=true;
		
		public function BaseObject() {
			platform = null;
		}
		public function attach(plat:Platform)
		{
			platform = plat;
		}
		public function getDirection()
		{
			return platform.getDirection();
		}
		public function getSpeed()
		{
			return platform.getSpeed();
		}
		public function setGoThrough(goThrough:Boolean)
		{
			this.goThrough = goThrough;
		}
		public function getGoThrough()
		{
			return goThrough;
		}
		public function update()
		{
			if(platform != null)
			{
				if (platform.getDirection() == C.UP || platform.getDirection() == C.DOWN)
				{
					y +=  platform.getSpeed();
				}
				else
				{
					x +=  platform.getSpeed();
				}
			}
		}
		public function getColor():uint
		{
			return 0x000001;
		}
	}
	
}
