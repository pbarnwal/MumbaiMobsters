package com.managers
{
	import flash.media.Sound;

	public class AudioManager
	{
		
		[Embed(source="/assets/sounds/Button_Click_Sound_revised_01.mp3")]
		private var ButtonSound:Class;
		
		[Embed(source="/assets/sounds/Error_Sound_revised_01.mp3")]
		private var ErrorSound:Class;
		
		[Embed(source="/assets/sounds/desert_eagle_shoot_revised_01.mp3")]
		private var DesertEagleSound:Class;
		
		[Embed(source="/assets/sounds/ak47-shoot_01.mp3")]
		private var AKFortySound:Class;
		
		[Embed(source="/assets/sounds/mp5-shoot_02.mp3")]
		private var MPFiveSound:Class;
		
		[Embed(source="/assets/sounds/p90-shoot_01.mp3")]
		private var PNinetySound:Class;
		
		private var buttonSound:Sound;
		private var errorSound:Sound;
		private var desertEagleSound:Sound;
		private var mpFiveSound:Sound;
		private var akFortySound:Sound;
		private var pNinetySound:Sound;
		
		
		private static var _instance:AudioManager;
		
		
		public function AudioManager()
		{
			
		}
		
		public static function getInstance():AudioManager
		{
			if(_instance == null){
				_instance = new AudioManager();
			}
			return _instance;
		}
		
		public function init():void{
			buttonSound = new ButtonSound() as Sound;
			errorSound = new ErrorSound() as Sound;
			desertEagleSound = new DesertEagleSound() as Sound;
			akFortySound = new AKFortySound() as Sound;
			mpFiveSound = new MPFiveSound() as Sound;
			pNinetySound = new PNinetySound() as Sound;
		}
		
		public function playButtonSound():void
		{
			buttonSound.play(0);
		}
		
		public function playErrorSound():void
		{
			errorSound.play(0);
		}
		
		public function playGunSound(gunType:int):void
		{
			if(gunType == 1)
			{
				desertEagleSound.play(0);
			}
			else if(gunType == 2)
			{
				mpFiveSound.play(0)
			}
			else if(gunType == 3)
			{
				pNinetySound.play(0);
			}
			else if(gunType == 4)
			{
				akFortySound.play(0);
			}
		}
	}
}