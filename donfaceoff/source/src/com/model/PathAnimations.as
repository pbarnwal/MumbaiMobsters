package com.model
{
	import com.managers.ConfigurationManager;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	import mx.binding.utils.ChangeWatcher;
	import mx.collections.ArrayCollection;
	import mx.events.PropertyChangeEvent;
	
	public class PathAnimations extends EventDispatcher
	{
		private static var instance:PathAnimations;
		private var configWatcher:ChangeWatcher;
		private var pathAnimations:Dictionary;
		private var lastSelectedAnim:int = -1;
		
		public function PathAnimations(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public static function getInstance():PathAnimations
		{
			if(instance == null){
				instance = new PathAnimations();
			}
			return instance;
		}
		
		//this function will be called before start loading config xml 
		public function init():void
		{
			configWatcher = ChangeWatcher.watch(ConfigurationManager.getInstance(), ["config"], configLoaded)
		}
		
		public function configLoaded(e:PropertyChangeEvent):void
		{
			var xml:XML = ConfigurationManager.getInstance().config;
			pathAnimations = new Dictionary();
			
			var levels:XML = xml..pathAnimations[0];
			var num:int = levels.children().length();
			for(var i:int = 0; i<num; i++){
				pathAnimations["level"+(i+1)] = levels.children()[i];
				//trace("Config loaded level"+(i+1))
				//trace("Config loaded "+ pathAnimations["level"+(i+1)])
			}
		}
		
		public function getAnimation():XMLList
		{
			var currentLevel:XML = pathAnimations["level"+ConfigurationManager.getInstance().currentLevel];
			if(currentLevel.path == null){
				return null;
			}
			var totalAnims:int = parseInt(currentLevel.path.length())
			var randAnim:int = getDifferentPathAnim(totalAnims);
			lastSelectedAnim = randAnim;
			var pathAnim:XML = currentLevel.path[randAnim];
			var xml:XMLList = new XMLList(pathAnim.toXMLString());
			return xml;
		}
		protected function getDifferentPathAnim(totalAnims:int):int
		{
			//because finally it will be an index to find the animation from the current level, not adding 1 is doing the trick
			var randAnim:int = Math.floor(Math.random()* totalAnims);
			if(lastSelectedAnim == randAnim && totalAnims > 1){
				return getDifferentPathAnim(totalAnims);
			}
			return randAnim;
		}
	}
}