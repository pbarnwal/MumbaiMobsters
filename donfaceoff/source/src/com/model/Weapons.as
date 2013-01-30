package com.model
{
	import com.managers.ConfigurationManager;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	import mx.binding.utils.ChangeWatcher;
	import mx.events.PropertyChangeEvent;
	
	[Bindable]
	public class Weapons extends EventDispatcher
	{
		private var configWatcher:ChangeWatcher;
		private static var _instance:Weapons;
		private var weaponsDict:Dictionary;
		
		public function Weapons(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public static function getInstance():Weapons
		{
			if(_instance == null){
				_instance = new Weapons();
			}
			return _instance;
		}
		public function init():void
		{
			weaponsDict = new Dictionary();
			configWatcher = ChangeWatcher.watch(ConfigurationManager.getInstance(), ["config"], configLoaded)
		}
		
		public function configLoaded(e:PropertyChangeEvent):void
		{
			var xml:XML = ConfigurationManager.getInstance().config;
			weaponsDict = new Dictionary();
			var weapons:XMLList = xml..weapon;
			for(var i:int = 0; i <weapons.length(); i++){
				var weapon:GunModel = new GunModel();
				weapon.id = parseInt(weapons[i].id);
				weapon.name = weapons[i].name;
				weapon.symbolName = weapons[i].symbolName;
				weapon.iconSource = weapons[i].icon;
				weapon.clipSize = weapons[i].clipSize;
				weapon.roundsPerMin = weapons[i].roundsPerMin;
				weapon.roundsPerTap = weapons[i].roundsPerTap;
				weapon.costPerBullet = weapons[i].costPerBullet;
				weapon.damagePerBullet = weapons[i].damagePerBullet;
				weaponsDict[weapon.id] = weapon;
			}
		}
		
		public function getWeaponById(val:int):GunModel
		{
			return weaponsDict[val];
		}
		
		public function getWeaponsList():Dictionary
		{
			return weaponsDict;
		}
	}
}