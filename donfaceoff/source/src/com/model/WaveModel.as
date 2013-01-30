package com.model
{
	import com.managers.ConfigurationManager;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	[Bindable]
	public class WaveModel extends EventDispatcher
	{
	
		private static var instance:WaveModel;
		
		//This id is not 0 based index rather it is 1 based index
		private var _waveId:int = 0;
		private var _totalHP:int = 0;
		private var _enemies:Array = [];
		private var _tempArr:Array;
		
		public function WaveModel(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public static function getInstance():WaveModel
		{
			if(instance == null){
				instance = new WaveModel();
			}
			return instance;
		}
		
		public function resetCache():void
		{
			waveId = 0;
			enemies = [];
		}
		
		public function generateNewWave():void {
			if(waveId < ConfigurationManager.getInstance().totalWaves){
				waveId++;
				enemies = [];
				calculateHealthPoints();
				createEnemySequence()
				populateWaveWithEnemies();
			}
		}
		
		private function calculateHealthPoints():void 
		{
			totalHP = 250;
			var diff:int = 50
			for (var i:int = 1; i <= waveId; i++) {
				totalHP += diff;
				if((i % 4) == 0){
					diff += 50;
				}
			}
		}
		
		private function createEnemySequence():void 
		{
			_tempArr = [];
			var arrTypes:Array = [1,2,3]
			while(sum()< totalHP){
				var rand:int = Math.floor(Math.random() * arrTypes.length) + 1
				var sumRes:int = sum();
				
				if(totalHP - sumRes == 50){
					rand = 1;
				}else if(totalHP - sumRes == 100){
					rand = 2;
				}else if(totalHP - sumRes == 150){
					rand = 3;
				}
				_tempArr.push(rand)
			}
		}
		
		private function populateWaveWithEnemies():void
		{
			//trace("_tempArr:"+_tempArr);
			for (var i:int = 0; i < _tempArr.length; i++) {
				var charModel:CharacterModel = ConfigurationManager.getInstance().getCharacter(_tempArr[i])
				_enemies.push(charModel);
			}
		}
		
		private function sum():int{
			var temp:int = 0
			for(var i:int =0; i<_tempArr.length; i++){
				temp += _tempArr[i]
			}
			return temp*50;
		}
		public function get waveId():int 
		{
			return _waveId;
		}
		
		public function set waveId(value:int):void 
		{
			_waveId = value;
		}
		
		public function get totalHP():int 
		{
			return _totalHP;
		}
		
		public function set totalHP(value:int):void 
		{
			_totalHP = value;
		}
		
		public function get enemies():Array 
		{
			return _enemies;
		}
		
		public function set enemies(value:Array):void 
		{
			_enemies = value;
		}
	}
}