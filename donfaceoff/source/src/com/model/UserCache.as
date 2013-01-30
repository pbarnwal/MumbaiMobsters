package com.model 
{
	import com.managers.ConfigurationManager;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	/**
	 * ...
	 * @author Devender Gupta
	 */
	[Bindable]
	public class UserCache extends EventDispatcher 
	{
		
		private var _score:int;
		private var _timer:int;
		private var _wave:int;
		private var _penalty:int;
		private var _escaped:int;
		
		private var _kills:int;
		private var _headShots:int;
		private var _multikill:int;
		private var _timeMultiplierBonus:int;
		
		private var _accountBalance:Number;
		private var _premiumGunOpted:int;
		private var _purchasedClipSize:int;
		
		private var _accessToken:String;
		private var _fbLink:String;
		private var _fbUserId:String;
		private var _fbLoginName:String;
		private var _fbUserName:String;
		private var _fbPicture:String;
		private var _fbFriends:String;
		
		private var _challengerFBId:String;
		private var _challengerFBName:String;
		private var _challengerFBPicture:String;
		private var _challengerScore:String;
		private var _challengeUUID:String;
		private var _newChallengeFBIds:Array;
		
		private var _playerPhoto:Loader;
		private var _challengerPhoto:Loader;
		private var _attemptingPendingChallenge:Boolean;
		private var _attemptingNewChallenge:Boolean;
		
		private var _configManager:ConfigurationManager;
		
		private static var instance:UserCache;
		
		public function UserCache() 
		{
			
		}
		
		public static function getInstance():UserCache
		{
			if(instance == null){
				instance = new UserCache();
			}
			return instance;
		}
		
		public function resetCache():void
		{
			instance = new UserCache();
		}
		
		public function resetFBDetails():void
		{
			accessToken = "";
			fbLink = "";
			fbUserId = "";
			fbUserName = "";
			fbLoginName = "";
		}
		
		public function get score():int 
		{
			return _score;
		}
		
		public function set score(value:int):void 
		{
			_score = value;
		}
		
		public function get kills():int 
		{
			return _kills;
		}
		
		public function set kills(value:int):void 
		{
			_kills = value;
		}
		
		public function get timer():int 
		{
			return _timer;
		}
		
		public function set timer(value:int):void 
		{
			_timer = value;
			if(_timer < 0){
				_timer = 0;
			}
		}
		
		public function get wave():int 
		{
			return _wave;
		}
		
		public function set wave(value:int):void 
		{
			_wave = value;
		}

		public function get penalty():int
		{
			return _penalty;
		}

		public function set penalty(value:int):void
		{
			_penalty = value;
		}

		public function get accountBalance():Number
		{
			return _accountBalance;
		}

		public function set accountBalance(value:Number):void
		{
			_accountBalance = value;
		}

		public function get accessToken():String
		{
			return _accessToken;
		}

		public function set accessToken(value:String):void
		{
			_accessToken = value;
		}

		public function get fbLink():String
		{
			return _fbLink;
		}

		public function set fbLink(value:String):void
		{
			_fbLink = value;
		}

		public function get fbUserId():String
		{
			return _fbUserId;
		}

		public function set fbUserId(value:String):void
		{
			_fbUserId = value;
		}

		public function get fbUserName():String
		{
			return _fbUserName;
		}

		public function set fbUserName(value:String):void
		{
			_fbUserName = value;
		}

		public function get fbLoginName():String
		{
			return _fbLoginName;
		}

		public function set fbLoginName(value:String):void
		{
			_fbLoginName = value;
		}

		public function get fbPicture():String
		{
			return _fbPicture;
		}

		public function set fbPicture(value:String):void
		{
			_fbPicture = value;
		}

		public function get fbFriends():String
		{
			return _fbFriends;
		}

		public function set fbFriends(value:String):void
		{
			_fbFriends = value;
		}

		public function get escaped():int
		{
			return _escaped;
		}

		public function set escaped(value:int):void
		{
			_escaped = value;
		}

		public function get premiumGunOpted():int
		{
			return _premiumGunOpted;
		}

		public function set premiumGunOpted(value:int):void
		{
			_premiumGunOpted = value;
		}

		public function get purchasedClipSize():int
		{
			return _purchasedClipSize;
		}

		public function set purchasedClipSize(value:int):void
		{
			_purchasedClipSize = value;
		}

		public function get headShots():int
		{
			return _headShots;
		}

		public function set headShots(value:int):void
		{
			_headShots = value;
		}

		public function get multikill():int
		{
			return _multikill;
		}

		public function set multikill(value:int):void
		{
			_multikill = value;
		}

		public function get timeMultiplierBonus():int
		{
			return _timeMultiplierBonus;
		}

		public function set timeMultiplierBonus(value:int):void
		{
			_timeMultiplierBonus = value;
		}

		protected function fnThumbnailLoaded(e:Event):void
		{
			trace("photoloaded");
		}

		public function get attemptingPendingChallenge():Boolean
		{
			return _attemptingPendingChallenge;
		}

		public function set attemptingPendingChallenge(value:Boolean):void
		{
			_attemptingPendingChallenge = value;
		}

		public function get challengerPhoto():Loader
		{
			return _challengerPhoto;
		}

		public function set challengerPhoto(value:Loader):void
		{
			_challengerPhoto = value;
		}


		public function get challengerScore():String
		{
			return _challengerScore;
		}

		public function set challengerScore(value:String):void
		{
			_challengerScore = value;
		}


		public function get challengerFBPicture():String
		{
			return _challengerFBPicture;
		}

		public function set challengerFBPicture(value:String):void
		{
			_challengerFBPicture = value;
		}


		public function get challengerFBName():String
		{
			return _challengerFBName;
		}

		public function set challengerFBName(value:String):void
		{
			_challengerFBName = value;
		}

		public function get challengerFBId():String
		{
			return _challengerFBId;
		}

		public function set challengerFBId(value:String):void
		{
			_challengerFBId = value;
		}

		public function get challengeUUID():String
		{
			return _challengeUUID;
		}
		
		public function set challengeUUID(value:String):void
		{
			_challengeUUID = value;
		}
		
		public function get attemptingNewChallenge():Boolean
		{
			return _attemptingNewChallenge;
		}

		public function set attemptingNewChallenge(value:Boolean):void
		{
			_attemptingNewChallenge = value;
		}

		public function get playerPhoto():Loader
		{
			return _playerPhoto;
		}

		public function set playerPhoto(value:Loader):void
		{
			_playerPhoto = value;
		}

		public function get newChallengeFBIds():Array
		{
			if(_newChallengeFBIds == null){
				_newChallengeFBIds = new Array();
			}
			return _newChallengeFBIds;
		}

		public function set newChallengeFBIds(value:Array):void
		{
			_newChallengeFBIds = value;
		}

		
		public function loadPlayerPhoto():void
		{
			if(accessToken){
				playerPhoto = new Loader();
				playerPhoto.contentLoaderInfo.addEventListener(Event.COMPLETE, fnThumbnailLoaded);
				playerPhoto.load(new URLRequest(fbPicture));			
			}
		}
		
		public function loadChallengerPhoto():void
		{
			if(_challengerFBPicture){
				challengerPhoto = new Loader();
				challengerPhoto.contentLoaderInfo.addEventListener(Event.COMPLETE, fnChallengerThumbnailLoaded);
				challengerPhoto.load(new URLRequest(challengerFBPicture));			
			}
		}
		
		private function fnChallengerThumbnailLoaded(e:Event):void
		{
			trace("Challenger's photo loaded");
		}
		
		public function sendPostOnUserWall(msg:String):void
		{
			if(accessToken != ""){
				var vars:URLVariables = new URLVariables();
				vars.message = msg;
				vars.subject = "FaceOff";	
				vars.access_token = accessToken;
				
				var urlLoader:URLLoader = new URLLoader();
				urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
				urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
				urlLoader.addEventListener(Event.COMPLETE, loaded)
				urlLoader.data = vars;
				
				var urlRequest:URLRequest = new URLRequest("https://graph.facebook.com/me/notes");
				urlRequest.method = URLRequestMethod.POST;
				urlRequest.data = vars;
				
				urlLoader.load(urlRequest);
			}
		}
		public function sendFeedFBUser(msg:String):void
		{
			if(accessToken != ""){
				var vars:URLVariables = new URLVariables();
				vars.picture = "http://play.mangogames.com/DonFaceoff/DonFaceOff.png";
				//"https://fbcdn-photos-a.akamaihd.net/photos-ak-snc7/v85005/85/415719985148077/app_103_415719985148077_1284389688.png"
				vars.message = msg 	
					
				vars.link = "https://apps.facebook.com/dongame/"
				
				vars.caption = "Don FaceOff"
				vars.name = "Dare to challenge me?!"
				vars.description = msg;
				
				vars.access_token = accessToken;
				vars.actions = JSON.stringify({name:"Play Now", link:"https://apps.facebook.com/dongame/"});
				
				var urlLoader:URLLoader = new URLLoader();
				urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
				//urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
				urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
				urlLoader.addEventListener(Event.COMPLETE, loaded)
				//urlLoader.data = vars;
				
				var urlRequest:URLRequest = new URLRequest("https://graph.facebook.com/me/feed");
				urlRequest.method = URLRequestMethod.POST;
				urlRequest.data = vars;
				urlLoader.load(urlRequest);
				
				if(attemptingNewChallenge){
					var numFriends:int = newChallengeFBIds.length;
					for(var i:int = 0; i<numFriends; i++){
						var friend:String = newChallengeFBIds[i].fbid; 
						urlRequest = new URLRequest("https://graph.facebook.com/"+friend+"/feed");
						urlRequest.method = URLRequestMethod.POST;
						urlRequest.data = vars;
						var fbUrlLoader:URLLoader = new URLLoader();
						fbUrlLoader.load(urlRequest);
					}
				}else if(attemptingPendingChallenge){
					urlRequest = new URLRequest("https://graph.facebook.com/"+challengerFBId+"/feed");
					urlRequest.method = URLRequestMethod.POST;
					urlRequest.data = vars;
					urlLoader.load(urlRequest);
				}
			}
		}
		
		private function ioErrorHandler(e:IOErrorEvent):void
		{
			trace("Some Error occured");
		}
		private function securityErrorHandler(e:SecurityErrorEvent):void
		{
			trace("Some Security Error occured");
		}
		private function loaded(e:Event):void
		{
			trace("Posted on wall");
		}
		
		public function resetArmory():void
		{
			premiumGunOpted = 0
			purchasedClipSize = 0
			WaveModel.getInstance().waveId = 0;
			wave = 0;
			escaped = 0;
			score = 0;
			kills = 0;
			headShots = 0;
			multikill = 0;
			timeMultiplierBonus = 0;
			
			if(attemptingPendingChallenge){
				_newChallengeFBIds = [];
				_newChallengeFBIds.push({fbid:parseInt(challengerFBId), name:challengerFBName});
				attemptingNewChallenge = true;
			}
			attemptingPendingChallenge = false;
			
			challengerFBId = "";
			challengerFBName = "";
			//challengerFBPicture = "";
			challengerScore = "";
			challengeUUID = "";
			//challengerPhoto = null;
		}
		public function resetChallengeData():void
		{
			premiumGunOpted = 0
			purchasedClipSize = 0
			WaveModel.getInstance().waveId = 0;
			wave = 0;
			escaped = 0;
			score = 0;
			kills = 0;
			headShots = 0;
			multikill = 0;
			timeMultiplierBonus = 0;
			
			challengerFBId = "";
			challengerFBName = "";
			//challengerFBPicture = "";
			challengerScore = "";
			challengeUUID = "";
			
			newChallengeFBIds = [];
			attemptingNewChallenge = false;
			attemptingPendingChallenge = false;
			//challengerPhoto = null;
		}
		
		public function addFriendsToChallenge(fbid:String, name:String):void
		{
			//trace("add:"+fbid);
			if(_newChallengeFBIds == null){
				_newChallengeFBIds = new Array()
			}
			var indexFound:int = getFriendIndex(fbid);
			if(indexFound == -1){
				_newChallengeFBIds.push({fbid:parseInt(fbid), name:name});
			}
		}
		
		public function removeFriendsToChallenge(fbid:String):void
		{
			//trace("remove:"+fbid);
			if(_newChallengeFBIds != null){
				var indexFound:int = getFriendIndex(fbid);
				if(indexFound != -1){
					_newChallengeFBIds.splice(indexFound, 1);
				}
			}
		}
		
		private function getFriendIndex(fbid:String):int
		{
			for(var i:int=0; i<_newChallengeFBIds.length; i++){
				if(_newChallengeFBIds[i].fbid == parseInt(fbid)){
					return i;
				}
			}
			return -1;
		}
		
		public function sendChallengeToFriends(callbackFunction:Function=null):void
		{
			var obj:Object = {userfbid:parseInt(fbUserId), userscore:score, username:fbUserName, friendfbid:newChallengeFBIds};
			
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorEventHandler)
			urlLoader.addEventListener(Event.COMPLETE, callbackFunction)
			
			var urlRequest:URLRequest = new URLRequest(configManager.serverDetails.@ip + "challenges/")
			urlRequest.contentType = "application/json"
			urlRequest.data = JSON.stringify(obj);
			urlRequest.method = URLRequestMethod.POST;
			urlLoader.load(urlRequest);
		}
		
		public function saveChallengeResult():void
		{
			var obj:Object = {fbid:parseInt(fbUserId), score:score, uuid:challengeUUID};
			
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorEventHandler)
			urlLoader.addEventListener(Event.COMPLETE, serverResponseHandler)
			
			var urlRequest:URLRequest = new URLRequest(configManager.serverDetails.@ip + "challenges/")
			urlRequest.contentType = "application/json";
			urlRequest.data = JSON.stringify(obj);
			urlRequest.method = URLRequestMethod.PUT;
			urlLoader.load(urlRequest);
		}
		
		public function loadPendingChallenges(callbackFunction:Function=null):void
		{
			//Getting all pending challenges
			var urlVariables:URLVariables = new URLVariables();
			urlVariables.fbid = parseInt(fbUserId);
			
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorEventHandler)
			urlLoader.addEventListener(Event.COMPLETE, callbackFunction)
			
			var urlRequest:URLRequest = new URLRequest(configManager.serverDetails.@ip + "challenges")
			urlRequest.contentType = "application/json";
			urlRequest.data = urlVariables
			urlRequest.method = URLRequestMethod.GET;
			urlLoader.load(urlRequest);
			
		}
		
		public function loadPreviousResults(callbackFunction:Function=null):void
		{
			//Getting all previous results
			var urlVariables:URLVariables = new URLVariables();
			urlVariables.fbid = parseInt(fbUserId);
			
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorEventHandler)
			urlLoader.addEventListener(Event.COMPLETE, callbackFunction)
			
			var urlRequest:URLRequest = new URLRequest(configManager.serverDetails.@ip + "challenges/result")
			urlRequest.contentType = "application/json";
			urlRequest.data = urlVariables
			urlRequest.method = URLRequestMethod.GET;
			urlLoader.load(urlRequest);
			
		}
		
		public function declineChallenge(selectedItem:Object, callbackFunction:Function=null):void
		{
			//Getting all previous results
			var obj:Object = {fbid:parseInt(fbUserId), uuid:parseInt(selectedItem.uuid)};

			var urlLoader:URLLoader = new URLLoader();
			urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorEventHandler)
			urlLoader.addEventListener(Event.COMPLETE, callbackFunction)
			
			var urlRequest:URLRequest = new URLRequest(configManager.serverDetails.@ip + "challenges/decline")
			urlRequest.contentType = "application/json";
			urlRequest.data = JSON.stringify(obj);
			urlRequest.method = URLRequestMethod.PUT;
			urlLoader.load(urlRequest);
		}
		
		private function serverResponseHandler(e:Event):void
		{
			
		}
		private function ioErrorEventHandler(e:IOErrorEvent):void
		{
			
		}
		public function get configManager():ConfigurationManager
		{
			if(_configManager == null){
				_configManager = ConfigurationManager.getInstance();
			}
			return _configManager;
		}


	}

}