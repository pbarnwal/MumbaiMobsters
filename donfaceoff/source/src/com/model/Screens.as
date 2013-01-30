package com.model
{
	public class Screens
	{
		public static const SPLASH_SCREEN:int = 1;
		public static const LOGIN_SCREEN:int = 2;
		public static const INTRO_SCREEN:int = 3;
		public static const CHALLENGE_SCREEN:int = 4;
		public static const MISSION_SELECTION_SCREEN:int = 5;
		public static const GUN_STORE_SCREEN:int = 6;
		public static const HELP_SCREEN:int = 7;
		public static const GAME_LEVEL_SCREEN:int = 8;
		public static const SCORE_CARD_SCREEN:int = 9;
		public static const CHALLENGE_RESULT_SCREEN:int = 10;
		public static const SETTINGS_SCREEN:int = 11;
		//For Popups the screen number should start from some distant number
		public static const GET_CASH_SCREEN:int = 21;
		
		public static var CURRENT_SCREEN:int = 1;
		public static var PREVIOUS_SCREEN:int = 0;
		public function Screens()
		{
		}
	}
}