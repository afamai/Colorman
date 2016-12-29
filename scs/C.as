package
{
	import flash.geom.ColorTransform;
	
	public class C 
	{
		public static const PLAYER_SPEED:Number = 5;
		public static const PLAYER_JUMP:Number = -12;
		
		public static const PLAYER_IDLE_RIGHT:String = "idleRight";
		public static const PLAYER_IDLE_LEFT:String = "idleLeft";
		public static const PLAYER_RUN_RIGHT:String = "runRight";
		public static const PLAYER_RUN_LEFT:String = "runLeft";
		public static const PLAYER_JUMP_RIGHT:String = "jumpRight";
		public static const PLAYER_JUMP_LEFT:String = "jumpLeft";
		public static const PLAYER_FALL_RIGHT:String = "fallingRight";
		public static const PLAYER_FALL_LEFT:String = "fallingLeft";
		public static const PLAYER_CROUCH_RIGHT:String = "crouchRight";
		public static const PLAYER_CROUCH_LEFT:String = "crouchLeft";
		
		public static const STAGE_HEIGHT:Number = 400;
		public static const STAGE_WIDTH:Number = 600;
				
		public static const MAX_JUMP_SPEED:Number = 15;
		public static const GRAVITY:Number = 1;
		
		public static const LEVEL_AMOUNT:int = 15;
		
		public static const PROJECTILE_HEIGHT:int= 30;
		public static const PROJECTILE_WIDTH:int= 15;
		public static const UP:int = 0;
		public static const LEFT:int = 1;
		public static const DOWN:int = 2;
		public static const RIGHT:int = 3;
		
		public static const WHITE:uint = 0xFFFFFF;
		public static const BLACK:uint = 0x000000;
		public static const RED:uint = 0xff0000;
		public static const BLUE:uint = 0x0066ff;
		public static const GREEN:uint = 0x009933;
		public static const YELLOW:uint = 0xffff00;
		public static const PURPLE:uint = 0xcc33ff;
		public static const ORANGE:uint = 0xff9900;
		
		public static var levelSelected:int = 8;
		
	}
	
}
