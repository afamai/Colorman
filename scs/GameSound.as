package  {
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.media.SoundChannel;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.media.SoundTransform;
	import flash.media.SoundMixer;
	import flash.events.Event;

	public class GameSound {

		public static var music:Sound;
		public static var musicChannel:SoundChannel;
		public static var soundVolume:Number;
		public static var musicVolume:Number;
		private static var timer:Timer;
		private static var trans:Boolean;
		public function GameSound() {
			soundVolume = 1;
			musicVolume = 1;
			music = new MiningByMoonlight();
			musicChannel = music.play(0,0, new SoundTransform(musicVolume));
			musicChannel.addEventListener(Event.SOUND_COMPLETE, replay);
		}
		public static function replay(evt:Event)
		{
			musicChannel = music.play(0,0, new SoundTransform(musicVolume));
		}
		public static function transition(newMusic:Sound)
		{
			trans = true;
			timer = new Timer(20);
			timer.addEventListener(TimerEvent.TIMER, volumeDown);
			timer.start();
			music = newMusic;
		}
		private static function volumeDown(e:TimerEvent)
		{
			var vol = musicChannel.soundTransform.volume-0.05;
			if(vol >= 0)
			{
				musicChannel.soundTransform = new SoundTransform(vol);
				
			}
			else
			{
				timer.stop();
				musicChannel.stop();
				musicChannel = music.play(0,0, new SoundTransform(musicVolume));
				musicChannel.addEventListener(Event.SOUND_COMPLETE, replay);
				trans = false;
			}
		}
		public static function changeMusicVolume(vol:Number)
		{
			musicVolume = vol;
			if(!trans)
				musicChannel.soundTransform = new SoundTransform(musicVolume);
		}
		public static function changeSoundVolume(vol:Number)
		{
			soundVolume = vol;
		}
		public static function playSound(snd:Sound)
		{
			snd.play(0,0,new SoundTransform(GameSound.soundVolume));
		}
		public static function stopMusic()
		{
			musicChannel.stop();
		}
		public static function playMusic()
		{
			musicChannel = music.play(musicVolume);
		}
	}
	
}
