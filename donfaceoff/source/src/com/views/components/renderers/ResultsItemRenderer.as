package com.views.components.renderers
{
	import com.events.ChallengeEvent;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	import spark.components.LabelItemRenderer;
	
	
	/**
	 * 
	 * ASDoc comments for this item renderer class
	 * 
	 */
	public class ResultsItemRenderer extends LabelItemRenderer
	{
		private var rowItem:ResultsRowItem;
		
		public function ResultsItemRenderer()
		{
			//TODO: implement function
			super();
		}
		
		/**
		 * @private
		 *
		 * Override this setter to respond to data changes
		 */
		override public function set data(value:Object):void
		{
			super.data = value;
			// the data has changed.  push these changes down in to the 
			// subcomponents here
			rowItem.txt_time.text = value.time;
			if(data.opponentscore >= data.initiatorscore){
				rowItem.txt_details.text = value.opponentname + " beat your score of " + data.initiatorscore + " in a FaceOff.";
			}else{
				rowItem.txt_details.text = "You beat "+ value.opponentname + "'s score of " + data.opponentscore + " in a FaceOff.";
			}
			
			if(value.photo != "" ){
				var loader:Loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, photoLoaded);
				rowItem.friends_photo_mc.addChild(loader);
				loader.x = 1;
				loader.y = 1;
				loader.load(new URLRequest(value.photo));
			}
		} 
		private function photoLoaded(e:Event):void
		{
			var loader:Loader = (e.currentTarget as LoaderInfo).loader;
			
		} 
		
		/**
		 * @private
		 * 
		 * Override this method to create children for your item renderer 
		 */	
		override protected function createChildren():void
		{
			//super.createChildren();
			// create any additional children for your item renderer here
			rowItem = new ResultsRowItem();
			rowItem.btn_fbshare.addEventListener(MouseEvent.CLICK, fbShareHandler);
			rowItem.btn_playagain.addEventListener(MouseEvent.CLICK, contiueHandler)
			addChild(rowItem);
		}
		
		protected function fbShareHandler(e:MouseEvent):void
		{
			var ev:ChallengeEvent = new ChallengeEvent(ChallengeEvent.FB_SHARE, true);
			ev.selectedIndex = itemIndex;
			dispatchEvent(ev);
		}
		protected function contiueHandler(e:MouseEvent):void
		{
			var ev:ChallengeEvent = new ChallengeEvent(ChallengeEvent.PLAY_AGAIN, true);
			ev.selectedIndex = itemIndex;
			dispatchEvent(ev);
		}
		/**
		 * @private
		 * 
		 * Override this method to change how the item renderer 
		 * sizes itself. For performance reasons, do not call 
		 * super.measure() unless you need to.
		 */ 
		override protected function measure():void
		{
			super.measure();
			// measure all the subcomponents here and set measuredWidth, measuredHeight, 
			// measuredMinWidth, and measuredMinHeight      		
		}
		
		/**
		 * @private
		 * 
		 * Override this method to change how the background is drawn for 
		 * item renderer.  For performance reasons, do not call 
		 * super.drawBackground() if you do not need to.
		 */
		override protected function drawBackground(unscaledWidth:Number, 
												   unscaledHeight:Number):void
		{
			//super.drawBackground(unscaledWidth, unscaledHeight);
			// do any drawing for the background of the item renderer here      		
		}
		
		/**
		 * @private
		 *  
		 * Override this method to change how the background is drawn for this 
		 * item renderer. For performance reasons, do not call 
		 * super.layoutContents() if you do not need to.
		 */
		override protected function layoutContents(unscaledWidth:Number, 
												   unscaledHeight:Number):void
		{
			super.layoutContents(unscaledWidth, unscaledHeight);
			// layout all the subcomponents here      		
		}
		
	}
}