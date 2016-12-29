package  
{
	import flash.geom.ColorTransform;
	
	public class ColorPellet extends BaseObject 
	{
		private var used:Boolean = false;
		public function setColor(color:uint)
		{
			var c = new ColorTransform();
			c.color = color;
			this.color.transform.colorTransform = c;
		}
		override public function getColor():uint
		{
			return uint(color.transform.colorTransform.color);
		}
		public function getUsed()
		{
			return used;
		}
		public function reset()
		{
			visible = true;
			used = false;
		}
		public function consumed()
		{
			visible = false;
			used = true;
		}
	}
	
}
