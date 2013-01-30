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
	public class StartChallengesItemRenderer extends LabelItemRenderer
	{
		
		private var rowItem:NewChallengeRowItem;
		
		public function StartChallengesItemRenderer()
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
			if(value == null || data.id == "dummy"){
				rowItem.visible = false
				return;
			}
			rowItem.visible = true;
			rowItem.txt_friend_name.text = value.name;
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
			rowItem = new NewChallengeRowItem();
			rowItem.selected_cb.addEventListener(MouseEvent.CLICK, cbClickHandler)
			addChild(rowItem);
		}
		
		protected function cbClickHandler(e:MouseEvent):void
		{
			var event:ChallengeEvent;
			var currFrame:int = rowItem.selected_cb.currentFrame;
			if(currFrame == 1){
				rowItem.selected_cb.gotoAndStop(2);
				event = new ChallengeEvent(ChallengeEvent.ADD_FRIENDS_TO_CHALLENGE,true);
			}else{
				rowItem.selected_cb.gotoAndStop(1);
				event = new ChallengeEvent(ChallengeEvent.REMOVE_FRIENDS_FROM_CHALLENGE,true);
			}
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