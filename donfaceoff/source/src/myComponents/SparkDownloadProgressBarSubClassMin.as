package myComponents
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.system.Capabilities;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import mx.preloaders.*;
	
	public class SparkDownloadProgressBarSubClassMin extends SparkDownloadProgressBar
	{
		private var _progressText:TextField;
		private var _textFormat:TextFormat;
		private var _barBG:Sprite;
		private var _bar:Sprite;
		
		public function SparkDownloadProgressBarSubClassMin() 
		{   
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			trace("stageWidth: ", stageWidth);
			trace("stageHeight: ", stageHeight);
			trace("Capabilities.screenResolutionX: ",Capabilities.screenResolutionX);
			trace("Capabilities.screenResolutionY: ",Capabilities.screenResolutionY);
		}
		
		// Embed the background image.     
		[Embed(source="assets/images/DonLoadingScreen.png")]
		[Bindable]
		public var imgCls:Class;
		
		// Override to set a background image.     
		override public function get backgroundImage():Object{
			return imgCls;
		}
		
		// Override to set the size of the background image to 100%.     
		override public function get backgroundSize():String{
			return "100%";
		}
		
		// Override to return true so progress bar appears
		// during initialization.       
		override protected function showDisplayForInit(elapsedTime:int, 
													   count:int):Boolean {
			return true;
		}
		
		// Override to return true so progress bar appears during download.     
		override protected function showDisplayForDownloading(
			elapsedTime:int, event:ProgressEvent):Boolean {
			return true;
		}
		
		/*override protected function initProgressHandler(event:Event):void
		{
		this.stageHeight = 1024;
		this.stageWidth = 768;
		}*/
		
		
		private function onAddedToStage(event:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			stage.displayState = StageDisplayState.FULL_SCREEN;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
		}
		
		override protected function createChildren():void 
		{
			super.createChildren();
			this.height = 768;
			this.width = 1024;
			this.x = 0;
			this.y = 0;
			
			var w:int = stageWidth
			var h:int = stageHeight;
			
			// Text Display
			_progressText = new TextField();
			_progressText.text = "LOADING";
			_progressText.width = 550;
			_progressText.height = 400;
			
			_textFormat = new TextFormat();
			_textFormat.font = 'Arial';
			_textFormat.size = 16;
			_textFormat.color = "0xffffff";
			
			_progressText.setTextFormat( _textFormat );
			
			_progressText.x = 20;
			_progressText.y = h/2 + 50;
			
			this.addChild( _progressText );
			
			// preload bar background
			/*_barBG = new Sprite();
			_barBG.graphics.beginFill( 0x000000 );
			_barBG.graphics.drawRect( 0, 0, w - 20, 20 );
			_barBG.x = 10;
			_barBG.y = h/2;
			this.addChild( _barBG );
			
			// preload bar
			_bar = new Sprite();
			_bar.x = 10;
			_bar.y = h/2 + 2;
			this.addChild( _bar );*/
		}
	}
	
}