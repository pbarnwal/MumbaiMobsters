package com.events
{
	import flash.events.Event;
	
	public class ChallengeEvent extends Event
	{
		
		public static const DECLINE_CHALLENGE:String = "decline_event";
		public static const ACCEPT_CHALLENGE:String = "accept_event";
		public static const ADD_FRIENDS_TO_CHALLENGE:String = "add_friends_to_challenge";
		public static const REMOVE_FRIENDS_FROM_CHALLENGE:String = "remove_friends_from_challenge";
		public static const FB_SHARE:String = "fb_share";
		public static const PLAY_AGAIN:String = "play_game_again";
		
		public var data:Object;
		public var selectedIndex:int = -1;
		
		public function ChallengeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}