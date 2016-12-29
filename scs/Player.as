package 
{

	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.media.SoundTransform;

	public class Player extends MovieClip
	{
		private var inAir:Boolean;
		private var jumping:Boolean;
		private var xSpeed:Number;
		private var ySpeed:Number;
		private var crouching:Boolean;
		private var jumpSpeed:Number;
		private var currentFloor:Array;
		private var d:int;
		private var flipped:Boolean;
		private var defaultColor:uint;
		private var startX:int;
		private var startY:int;
		private var hBoxX1:DisplayObject;
		private var hBoxX2:DisplayObject;
		private var hBoxY1:DisplayObject;
		private var hBoxY2:DisplayObject;

		public function Player(color:uint = C.WHITE)
		{
			d = 1;
			startX = x;
			startY = y;
			xSpeed = 0;
			ySpeed = 0;
			jumpSpeed = 0;
			currentFloor = new Array();
			flipped = false;
			crouching = false;
			hBoxX1 = hitBoxX1;
			hBoxX2 = hitBoxX2;
			hBoxY1 = hitBoxY1;
			hBoxY2 = hitBoxY2;
			defaultColor = color;
			inAir = true;
			setColor(color);
		}
		override public function stop():void
		{
			super.stop();
			color.stop();
		}
		public function moveLeft()
		{
			xSpeed =  -  C.PLAYER_SPEED;
			d = -1;
		}
		public function moveRight()
		{
			xSpeed = C.PLAYER_SPEED;
			d = 1;
		}
		public function jump()
		{
			GameSound.playSound(new Jump());
			if (! flipped)
			{
				ySpeed = C.PLAYER_JUMP;
			}
			else
			{
				ySpeed =  -  C.PLAYER_JUMP;
			}
			inAir = true;
		}
		public function crouch(stat:Boolean)
		{
			crouching = stat;
			if (crouching)
			{
				xSpeed = 0;
			}
		}
		public function isInAir()
		{
			return (inAir);
		}
		public function stopMoving()
		{
			xSpeed = 0;
		}
		public function isFalling()
		{
			if (flipped)
			{
				return (ySpeed < 0);
			}
			return (ySpeed > 0);
		}
		public function isFlipped()
		{
			return flipped;
		}
		public function hitFloor(floor:BaseObject)
		{
			if(currentFloor.indexOf(floor) == -1)
			{
				inAir = false;
				if (! flipped)
				{
					y = floor.y;
				}
				else
				{
					y = floor.y + floor.height;
				}
				currentFloor.push(floor);
				ySpeed = 0;
			}
		}
		public function removeFloor()
		{
			currentFloor.shift();
			if(currentFloor.length == 0)
				inAir = true;
		}
		public function fallBackDown()
		{
			ySpeed = 0;
			if (flipped)
			{
				y -=  3;
			}
			else
			{
				y +=  3;
			}
		}
		public function respawn()
		{
			x = startX;
			y = startY;
			ySpeed = 0;
			if (flipped)
			{
				rotation +=  180;
				scaleX *=  -1;
				flipped = false;
			}
			setColor(defaultColor);
			currentFloor.length = 0;
		}
		public function flip()
		{
			rotation +=  180;
			if (! flipped)
			{
				y -=  height;
			}
			else
			{
				y +=  height;
			}
			scaleX *=  -1;
			flipped = ! flipped;
		}
		public function moveNewPoint(obj:BaseObject, dir:int)
		{
			var side;
			if (dir < 0)
			{
				side = hBoxX2;
			}
			else
			{
				side = hBoxX1;
			}
			while (side.hitTestObject(obj))
			{
				x +=  dir;
			}
		}
		public function stopX(point:int)
		{
			x = point;
		}
		public function setColor(color:uint)
		{
			var c = new ColorTransform();
			c.color = color;
			this.color.transform.colorTransform = c;
		}
		public function getColor():uint
		{
			return uint(color.transform.colorTransform.color);
		}
		public function getHitBoxX1()
		{
			return hBoxX1;
		}
		public function getHitBoxX2()
		{
			return hBoxX2;
		}
		public function getHitBoxY1()
		{
			return hBoxY1;
		}
		public function getHitBoxY2()
		{
			return hBoxY2;
		}
		public function update()
		{
			x +=  xSpeed;
			if (inAir)
			{
				if (! flipped)
				{
					ySpeed +=  C.GRAVITY;
				}
				else if (flipped)
				{
					ySpeed -=  C.GRAVITY;
				}
				y +=  ySpeed;
			}
			
			if (currentFloor.length != 0)
			{
				var temp:BaseObject = currentFloor[currentFloor.length - 1];
				if (! this.hitTestObject(temp) || this.color.transform.colorTransform.color == temp.getColor())
				{
					removeFloor();
				}
				else
				{
					if (temp.getDirection() == C.UP || temp.getDirection() == C.DOWN)
					{
						y +=  temp.getSpeed();
					}
					else if (temp.getDirection() == C.LEFT || temp.getDirection() == C.RIGHT)
					{
						x +=  temp.getSpeed();
					}
				}
			}
			if (y >= C.STAGE_HEIGHT)
			{
				inAir = false;
				y = C.STAGE_HEIGHT;
			}
			else if (y <= 0)
			{
				inAir = false;
				y = 0;
			}

			if (inAir)
			{
				if (! isFalling())
				{
					if (d>0)
					{
						gotoAndPlay(C.PLAYER_JUMP_RIGHT);
					}
					else
					{
						gotoAndPlay(C.PLAYER_JUMP_LEFT);
					}
				}
				else
				{
					if (d>0)
					{
						if (this.currentLabel != C.PLAYER_FALL_RIGHT)
						{
							gotoAndPlay(C.PLAYER_FALL_RIGHT);
						}
					}
					else
					{
						if (this.currentLabel != C.PLAYER_FALL_LEFT)
						{
							gotoAndPlay(C.PLAYER_FALL_LEFT);
						}
					}
				}
			}
			else if (crouching)
			{
				if (d == 1)
				{
					if (this.currentLabel != C.PLAYER_CROUCH_RIGHT)
					{
						gotoAndPlay(C.PLAYER_CROUCH_RIGHT);
					}
				}
				else
				{
					if (this.currentLabel != C.PLAYER_CROUCH_LEFT)
					{
						gotoAndPlay(C.PLAYER_CROUCH_LEFT);
					}
				}
			}
			else
			{
				if (xSpeed > 0)
				{
					if (this.currentLabel != C.PLAYER_RUN_RIGHT)
					{
						this.gotoAndPlay(C.PLAYER_RUN_RIGHT);
					}
				}
				else if (xSpeed < 0)
				{
					if (this.currentLabel != C.PLAYER_RUN_LEFT)
					{
						gotoAndPlay(C.PLAYER_RUN_LEFT);
					}
				}
				else if (xSpeed == 0)
				{
					if (d == 1)
					{
						if (this.currentLabel != C.PLAYER_IDLE_RIGHT)
						{
							gotoAndPlay(C.PLAYER_IDLE_RIGHT);
						}
					}
					else
					{
						if (this.currentLabel != C.PLAYER_IDLE_LEFT)
						{
							gotoAndPlay(C.PLAYER_IDLE_LEFT);
						}
					}
				}
			}
		}
	}
}