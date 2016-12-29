package 
{
	import flash.geom.ColorTransform;

	public class Platform extends BaseObject
	{

		private var dir:int;
		private var speed:int;
		private var distance:int;
		private var travelDis:int;
		private var moving:Boolean;
		public function Platform()
		{
			setMove(-1,0,0);
		}
		public function setPosition(xPos:int, yPos:int)
		{
			x = xPos;
			y = yPos;
		}
		public function setMove(direct:int, spd:int, dis:int)
		{
			moving = true;
			dir = direct;
			speed = spd;
			distance = dis;
			travelDis = 0;
		}
		public function setColor(color:uint)
		{
			var c = new ColorTransform();
			c.color = color;
			this.transform.colorTransform = c;
		}
		override public function getSpeed()
		{
			return speed;
		}
		override public function getDirection()
		{
			return dir;
		}
		override public function getColor():uint
		{
			return uint(this.transform.colorTransform.color);
		}
		override public function update()
		{
			super.update();
			if (moving)
			{
				if (dir == C.UP || dir == C.DOWN)
				{
					y +=  speed;
				}
				else
				{
					x +=  speed;
				}
				travelDis +=  Math.abs(speed);
				if (travelDis >= distance)
				{
					speed =  -  speed;
					travelDis = 0;
				}
			}
		}
	}
}