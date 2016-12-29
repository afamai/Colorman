package  {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Cannon extends BaseObject {
		 
		private var timer:Timer;
		private var speed:int;
		private var dir:int;
		public function settings(dir:int, speed:int, delay:int, goThrough:Boolean=true)
		{
			setGoThrough(goThrough);
			this.dir = dir;
			this.speed = speed;
			timer = new Timer(delay);
			timer.addEventListener(TimerEvent.TIMER, shootProj);
			timer.start();
		}
		public function getProjectile()
		{
			var proj:Spike = new Spike();
			proj.projectile(dir,speed);
			proj.height = C.PROJECTILE_HEIGHT;
			proj.width = C.PROJECTILE_WIDTH;
			proj.setGoThrough(getGoThrough());
			if(dir == C.RIGHT)
			{
				proj.rotation = 90;
				proj.setPosition(x+C.PROJECTILE_HEIGHT,y);
			}
			else if(dir == C.LEFT)
			{
				proj.rotation = -90;
				proj.setPosition(x-C.PROJECTILE_HEIGHT,y);
			}
			else if(dir == C.DOWN)
			{
				proj.rotation = 180;
				proj.setPosition(x,y+C.PROJECTILE_HEIGHT);
			}
			else
			{
				proj.setPosition(x,y-C.PROJECTILE_HEIGHT);
			}
			return proj;
		}
		public function shootProj(e:TimerEvent=null)
		{
			gotoAndPlay("shoot");
			var myStage:BaseLevel = parent as BaseLevel;
			var proj:Spike = getProjectile();
			myStage.addChildAt(proj,0);
			myStage.addCollision(proj);
		}
		public function pauseProj()
		{
			timer.stop();
		}
		public function resume()
		{
			timer.start();
		}
	}
	
}
