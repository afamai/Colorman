package 
{

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.Stage;
	import flash.display.DisplayObject;
	import flash.utils.Timer;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.media.SoundTransform;
	import flash.display.IBitmapDrawable;
	


	public class Controller extends MovieClip
	{

		private var player:Player;
		private var moveX:int;
		private var jump:Boolean;
		private var isCrouching:Boolean;
		private var platforms:Array;
		private var collisionGroup:Array;
		private var portal:Portal;
		private var hit:Boolean = false;
		private var myGameStage:MovieClip;
		private var isPaused:Boolean = false;
		private var restart:Boolean = false;
		private var tempArray:Array = [];
		public function startGame()
		{
			new GameSound();
			new MainMenu(stage).load();
			stage.addEventListener("gameStart", runGame);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, myKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, myKeyUp);
		}
		private function runGame(e:Event)
		{
			loadLevel(C.levelSelected);
			stage.addChild(myGameStage);
		}
		private function masterLoop(e:Event)
		{
			if (! isPaused)
			{
				myGameStage.alpha = 1;
				update();
				player.play();
			}
			else
			{
				myGameStage.alpha = 0.1;
				player.stop();
			}
			for each (var obj:BaseObject in collisionGroup)
			{
				if (obj is Cannon)
				{
					var temp = obj as Cannon;
					if (isPaused)
					{
						temp.pauseProj();
					}
					else
					{
						temp.resume();
					}
				}

			}
		}
		private function openPauseMenu(e:MouseEvent)
		{
			myGameStage.getPauseBtn().removeEventListener(MouseEvent.MOUSE_DOWN, openPauseMenu);
			isPaused = true;
			new PauseMenu(this,stage).load();
		}
		private function loadLevel(level:int)
		{
			collisionGroup = new Array();
			switch (level)
			{
				case 1 :
					myGameStage = new Level1();
					break;
				case 2 :
					myGameStage = new Level2();
					break;
				case 3 :
					myGameStage = new Level3();
					break;
				case 4 :
					myGameStage = new Level4();
					break;
				case 5 :
					myGameStage = new Level5();
					break;
				case 6 :
					myGameStage = new Level6();
					break;
				case 7 :
					myGameStage = new Level7();
					break;
				case 8 :
					myGameStage = new Level8();
					break;
				case 9 :
					myGameStage = new Level9();
					break;
				case 10 :
					myGameStage = new Level10();
					break;
				case 11 :
					myGameStage = new Level11();
					break;
				case 12 :
					myGameStage = new Level12();
					break;
				case 13 :
					myGameStage = new Level13();
					break;
				case 14 :
					myGameStage = new Level14();
					break;
				case 15 :
					myGameStage = new Level15();
					break;
			}
			collisionGroup = myGameStage.getCollisions();
			myGameStage.addEventListener(Event.ENTER_FRAME, masterLoop);
			myGameStage.getPauseBtn().addEventListener(MouseEvent.MOUSE_DOWN, openPauseMenu);
			player = myGameStage.getPlayer();
		}
		private function myKeyDown(e:KeyboardEvent)
		{
			if (e.keyCode == Keyboard.LEFT)
			{
				moveX = -1;
			}
			else if (e.keyCode == Keyboard.RIGHT)
			{
				moveX = 1;
			}
			if (e.keyCode == Keyboard.UP)
			{
				jump = true;
			}
			else if (e.keyCode == Keyboard.DOWN)
			{
				isCrouching = true;
			}
			if (e.keyCode == Keyboard.SPACE)
			{
				isPaused = ! isPaused;
			}
			if (e.keyCode == Keyboard.R)
			{
				restart = true;
			}
		}

		private function myKeyUp(e:KeyboardEvent)
		{
			if (e.keyCode == Keyboard.LEFT || e.keyCode == Keyboard.RIGHT)
			{
				moveX = 0;
			}
			if (e.keyCode == Keyboard.UP)
			{
				jump = false;
			}
			if (e.keyCode == Keyboard.DOWN)
			{
				isCrouching = false;
			}
		}
		public function nextLevel()
		{
			loadLevel(C.levelSelected);
			stage.addChild(myGameStage);
		}
		public function removeCurrentLevel()
		{
			isPaused = false;
			myGameStage.removeEventListener(Event.ENTER_FRAME, masterLoop);
			myGameStage.getPauseBtn().removeEventListener(MouseEvent.MOUSE_DOWN, openPauseMenu);
			stage.removeChild(myGameStage);
		}
		public function resume()
		{
			isPaused = false;
			myGameStage.getPauseBtn().addEventListener(MouseEvent.MOUSE_DOWN, openPauseMenu);
		}
		public function getPaused()
		{
			return isPaused;
		}
		public function update()
		{
			collisionGroup = myGameStage.getCollisions();
			if (restart)
			{
				player.respawn();
				for each (var object in tempArray)
				{

					object.reset();
				}
				restart = false;
			}
			//check if player pressed left or right button
			if (moveX > 0)
			{
				player.moveRight();
			}
			else if (moveX < 0)
			{
				player.moveLeft();
			}
			else
			{
				player.stopMoving();
			}
			//check is player is jumping, if jumping then the player can't jump again
			if (jump && !player.isInAir())
			{
				player.jump();
				jump = false;
			}
			player.crouch(isCrouching);

			//update the player
			player.update();
			
			for(var j:int = 0; j < collisionGroup.length; j++)
			{
				var obj = collisionGroup[j];
				obj.update();
				if (obj is GravityField && !obj.isActivate())
				{
					obj.reactivate(player);
				}
				else if (obj is Spike && !obj.getGoThrough())
				{
					for(var k:int = 0; k < collisionGroup.length; k++)
					{
						if (collisionGroup[k] is Platform && collisionGroup[k].hitTestObject(obj))
						{
							obj.kill();
						}
					}
				}
				if (player.hitTestObject(obj))
				{
					if (obj is Platform)
					{
						if (player.getColor() == C.WHITE || player.getColor() != obj.getColor())
						{
							if (player.getHitBoxX1().hitTestObject(obj))
							{
								player.moveNewPoint(obj,1);
							}
							else if (player.getHitBoxX2().hitTestObject(obj))
							{
								player.moveNewPoint(obj, -1);
							}
							//if the player lands on a platform, make sure player is on top of the platform
							if (player.getHitBoxY2().hitTestObject(obj))
							{
								player.hitFloor(obj);
							}
							if (player.isInAir())
							{
								//if the player lands on a platform, make sure player is on top of the platform
								
								if (player.getHitBoxY1().hitTestObject(obj))
								{
									player.fallBackDown();
								}
							}

						}
					}
					else if (obj is Spike && !restart)
					{
						restart = true;
						if(player.isFlipped())
							addChild(new DeathAni(player.x+player.width/2, player.y+player.height/2));
						else
							addChild(new DeathAni(player.x+player.width/2, player.y-player.height/2))
					}
					else if (obj is ColorPellet && !obj.getUsed())
					{
						GameSound.playSound(new PowerUp());
						player.setColor(obj.getColor());
						obj.consumed();
						tempArray.push(obj);
					}
					else if (obj is GravityField && obj.isActivate())
					{
						player.flip();
						obj.deActivate();
					}
					else if (obj is Portal)
					{
						C.levelSelected++;
						removeCurrentLevel();
						if(C.levelSelected < 16)
							new TransitionPanel(stage,C.levelSelected).load();
						else
							new Congratz(stage).load();
					}
				}
			}
		}
	}

}