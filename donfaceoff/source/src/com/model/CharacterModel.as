package com.model
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	[Bindable]
	public class CharacterModel extends EventDispatcher
	{

		private var _type:int = 0;
		private var _healthPoints:int = 0;
		private var _timePenalty:int = 0;
		private var _points:int = 0;
		private var _timeBonus:int = 0;
		private var _timePointsMultiplier:int = 0;
		private var _multiKillBonus:int = 0;
		
		public function CharacterModel(target:IEventDispatcher=null)
		{
			super(target);
		}

		public function get healthPoints():int
		{
			return _healthPoints;
		}

		public function set healthPoints(value:int):void
		{
			_healthPoints = value;
		}

		public function get timePenalty():int
		{
			return _timePenalty;
		}

		public function set timePenalty(value:int):void
		{
			_timePenalty = value;
		}

		public function get points():int
		{
			return _points;
		}

		public function set points(value:int):void
		{
			_points = value;
		}

		public function get timeBonus():int
		{
			return _timeBonus;
		}

		public function set timeBonus(value:int):void
		{
			_timeBonus = value;
		}

		public function get timePointsMultiplier():int
		{
			return _timePointsMultiplier;
		}

		public function set timePointsMultiplier(value:int):void
		{
			_timePointsMultiplier = value;
		}

		public function get multiKillBonus():int
		{
			return _multiKillBonus;
		}

		public function set multiKillBonus(value:int):void
		{
			_multiKillBonus = value;
		}

		public function get type():int
		{
			return _type;
		}

		public function set type(value:int):void
		{
			_type = value;
		}


	}
}