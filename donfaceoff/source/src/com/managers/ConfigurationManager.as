package com.managers
{
	import com.model.CharacterModel;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class ConfigurationManager extends EventDispatcher
	{
		
		private var _config:XML;
		private static var _instance:ConfigurationManager;
		private var _characterTimerCount:int;
		private var _waveTimerCount:int;
		private var _eliteguardFiringTimer:int;
		private var _currentLevel:int = 1;
		private var _gameTimerCount:Number;
		private var _delayInGameTimerCount:Number;
		private var _multikillTimer:int
		private var _priceToDonCashRatio:Number = 10000;
		private var _serverDetails:XMLList;
		
		public function ConfigurationManager(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public static function getInstance():ConfigurationManager
		{
			if(_instance == null){
				_instance = new ConfigurationManager();
			}
			return _instance;
		}
		
		[Bindable]
		public function get config():XML
		{
			return _config;
		}

		public function set config(value:XML):void
		{
			_config = value;
			characterTimerCount = parseInt(_config..timers.characterTimer)
			gameTimerCount = parseInt(_config..timers.gameTimer)
			delayInGameTimerCount = parseInt(_config..timers.delayInGameTimerStart)
			waveTimerCount = parseInt(_config..timers.waveTimer);
			eliteguardFiringTimer = parseInt(_config..timers.eliteguardTimer)
			multikillTimer = parseInt(_config..timers.multikillTimer)
			_serverDetails = config..server;
		}

		public function get characterTimerCount():int
		{
			return _characterTimerCount;
		}

		public function set characterTimerCount(value:int):void
		{
			_characterTimerCount = value;
		}

		public function get waveTimerCount():int
		{
			return _waveTimerCount;
		}

		public function set waveTimerCount(value:int):void
		{
			_waveTimerCount = value;
		}

		public function get totalWaves():int
		{
			return parseInt(config..waves.totalWaves);
		}
		public function getCharacter(charType:int):CharacterModel
		{
			var charModel:CharacterModel = new CharacterModel();
			var xml:XMLList = config..character.(type == charType);
			charModel.type = parseInt(xml.type);
			charModel.healthPoints = xml.healthPoints;
			charModel.points = xml.killPoints;
			charModel.timePenalty = xml.timePenalty;
			charModel.timeBonus = xml.timeBonus;
			charModel.timePointsMultiplier = xml.timePointsMultiplier;
			charModel.multiKillBonus = xml.multiKillBonus;
			return charModel;
		}
		
		public function getCurrencyFormat(_amount:Number, isCurrecyFormat:Boolean = true):String {
			var strAmount:String = String(_amount);
			var lastIndex:uint = (strAmount.indexOf(".") == -1)?strAmount.length:strAmount.indexOf(".");
			var firstChar:String=(strAmount.indexOf("-")==-1)?"":"-";
			var strAmountBeforeDot:String = (firstChar.length>0)?strAmount.substr(1,lastIndex):strAmount.substr(0,lastIndex);
			/*var strLastDigit:String = (strAmount.indexOf(".") == -1)?"00":strAmount.substr(strAmount.indexOf(".") + 1, strAmount.length);
			if (strLastDigit.length == 1)
			{
			strLastDigit +=  "0";
			}
			strLastDigit = "." + strLastDigit;
			strLastDigit = "";*/
			strAmountBeforeDot = (strAmountBeforeDot.indexOf(".") == -1)?strAmountBeforeDot:strAmountBeforeDot.substr(0, strAmountBeforeDot.length - 1);
			var formattedString:String = strAmountBeforeDot;
			if (strAmountBeforeDot.length > 3)
			{
				formattedString =  strAmountBeforeDot.substr(strAmountBeforeDot.length - 3, strAmountBeforeDot.length);
				strAmountBeforeDot = strAmountBeforeDot.substr(0, strAmountBeforeDot.length - 3);
				while (strAmountBeforeDot.length>0)
				{
					var tempStr:String = "";
					if (strAmountBeforeDot.length > 1)
					{
						tempStr = strAmountBeforeDot.substr(strAmountBeforeDot.length - 2, strAmountBeforeDot.length);
						strAmountBeforeDot = strAmountBeforeDot.substr(0, strAmountBeforeDot.length - 2);
						formattedString = tempStr +"," + formattedString;
					}
					else
					{
						tempStr = strAmountBeforeDot.charAt(0) + ",";
						strAmountBeforeDot = "";
						formattedString = tempStr + formattedString;
					}
				}
				//if (strLastDigit != ".00")
				//formattedString +=  strLastDigit;
			}
			else
			{
				//if (strLastDigit != ".00")
				//formattedString +=  strLastDigit;
			}
			if (formattedString.toLowerCase() == "nan") {
				return "";
			}
			
			formattedString = firstChar + formattedString;
			if(isCurrecyFormat){
				formattedString = "$ "+ formattedString;
			}
			return formattedString;
		}
		

		public function getLevelImage():Class
		{
			if(currentLevel == 1){
				return Level1ImageMc;
			}else if(currentLevel == 2){
				return Level2ImageMc;
			}else if(currentLevel == 3){
				return Level3ImageMc;
			}
			return null
		}

		public function get currentLevel():int
		{
			return _currentLevel;
		}

		public function set currentLevel(value:int):void
		{
			_currentLevel = value;
		}
		
		public function get eliteguardFiringTimer():int 
		{
			return _eliteguardFiringTimer;
		}
		
		public function set eliteguardFiringTimer(value:int):void 
		{
			_eliteguardFiringTimer = value;
		}
		
		public function get gameTimerCount():Number 
		{
			return _gameTimerCount;
		}
		
		public function set gameTimerCount(value:Number):void 
		{
			_gameTimerCount = value;
		}
		
		public function get delayInGameTimerCount():Number 
		{
			return _delayInGameTimerCount;
		}
		
		public function set delayInGameTimerCount(value:Number):void 
		{
			_delayInGameTimerCount = value;
		}

		public function get multikillTimer():int
		{
			return _multikillTimer;
		}

		public function set multikillTimer(value:int):void
		{
			_multikillTimer = value;
		}

		public function get priceToDonCashRatio():Number
		{
			return _priceToDonCashRatio;
		}

		public function set priceToDonCashRatio(value:Number):void
		{
			_priceToDonCashRatio = value;
		}

		public function get serverDetails():XMLList
		{
			return _serverDetails;
		}

		public function set serverDetails(value:XMLList):void
		{
			_serverDetails = value;
		}


	}
}