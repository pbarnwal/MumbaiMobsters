package com.model
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	[Bindable]
	public class GunModel extends EventDispatcher
	{
		private var _id:int = 0
		private var _iconSource:String = "";
		private var _name:String = "";
		private var _symbolName:String = "";
		private var _damagePerBullet:int = 0;
		private var _clipSize:int = 0;
		private var _clipSizeMultiplier:int = 0;
		private var _roundsPerMin:int = 0;
		//Damage per tap can be calculated as _damagePerBullet * _roundsPerTap
		private var _roundsPerTap:int = 0;
		private var _costPerBullet:int = 0;
		public function GunModel(target:IEventDispatcher=null)
		{
			super(target);
		}

		public function get iconSource():String
		{
			return _iconSource;
		}

		public function set iconSource(value:String):void
		{
			_iconSource = value;
		}

		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function get damagePerBullet():int
		{
			return _damagePerBullet;
		}

		public function set damagePerBullet(value:int):void
		{
			_damagePerBullet = value;
		}

		public function get clipSize():int
		{
			return _clipSize;
		}

		public function set clipSize(value:int):void
		{
			_clipSize = value;
		}

		public function get roundsPerMin():int
		{
			return _roundsPerMin;
		}

		public function set roundsPerMin(value:int):void
		{
			_roundsPerMin = value;
		}

		public function get roundsPerTap():int
		{
			return _roundsPerTap;
		}

		public function set roundsPerTap(value:int):void
		{
			_roundsPerTap = value;
		}

		public function get costPerBullet():int
		{
			return _costPerBullet;
		}

		public function set costPerBullet(value:int):void
		{
			_costPerBullet = value;
		}

		public function get id():int
		{
			return _id;
		}

		public function set id(value:int):void
		{
			_id = value;
		}

		public function get symbolName():String
		{
			return _symbolName;
		}

		public function set symbolName(value:String):void
		{
			_symbolName = value;
		}

		public function get clipSizeMultiplier():int
		{
			return _clipSizeMultiplier;
		}

		public function set clipSizeMultiplier(value:int):void
		{
			_clipSizeMultiplier = value;
		}


	}
}