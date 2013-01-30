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
	public class PendingChallengesItemRenderer extends LabelItemRenderer
	{
		
		private var rowItem:PendingChallengesRowItem;
		
		public function PendingChallengesItemRenderer()
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
			if(data == null){
				return;
			}
			rowItem.txt_friend_name.text = value.name;
			rowItem.txt_friend_score.text = value.score;
			if(value.photo != "" ){
				var loader:Loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, photoLoaded)
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
			rowItem = new PendingChallengesRowItem();
			addChild(rowItem);
			rowItem.btn_decline.addEventListener(MouseEvent.CLICK, declineChallengeHandler);
			rowItem.btn_accept.addEventListener(MouseEvent.CLICK, acceptChallengeHandler)
		}
		
		protected function declineChallengeHandler(e:MouseEvent):void
		{
			var event:ChallengeEvent = new ChallengeEvent(ChallengeEvent.DECLINE_CHALLENGE, true);
			event.selectedIndex = this.itemIndex;
			dispatchEvent(event);
		}
		
		protected function acceptChallengeHandler(e:MouseEvent):void
		{
			var event:ChallengeEvent = new ChallengeEvent(ChallengeEvent.ACCEPT_CHALLENGE, true);
			event.selectedIndex = this.itemIndex;
			dispatchEvent(event);
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