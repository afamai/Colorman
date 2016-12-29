package  {
	
	import flash.display.MovieClip;
	
	
	public class SnowFlake extends MovieClip {
		
		private var ySpeed:Number;
		private var xSpeed:Number;
		private var xPoint:Number;
		private var rSpeed:Number;
		public function SnowFlake() {
			reset();
			y = -(Math.random()*1000);
		}
		public function update()
		{
			y += ySpeed;
			x += xSpeed;
			rotation += rSpeed;
			if(xSpeed > 0 && x > xPoint)
			{
				newXPoint();
				if(x > xPoint)
					xSpeed *= -1;
			}
			else if(xSpeed < 0 && x < xPoint)
			{
				newXPoint();
				if(x < xPoint)
					xSpeed *= -1;
			}
			if(y > C.STAGE_HEIGHT)
			{
				reset();
			}
		}
		public function newXPoint()
		{
			xPoint = Math.random()*(600-width);
		}
		public function reset()
		{
			width = Math.random()*30 + 20;
			height = width;
			alpha = Math.random()*0.5;
			x = Math.random()*600;
			y = -width;
			ySpeed = Math.random()*3+1;
			xSpeed = Math.random();
			rSpeed = Math.random()*5-3;
			newXPoint();
		}
	}
	
}
