package  {
	
	import flash.display.MovieClip;
	
	
	public class DeathAni extends MovieClip {
		
		
		public function DeathAni(xPos:int=0, yPos:int=0) {
			x = xPos;
			y = yPos;
		}
		public function setColor()
		{
			this.transform.colorTransform.color = C.BLUE;
		}
		public function kill()
		{
			parent.removeChild(this);
		}
	}
	
}
