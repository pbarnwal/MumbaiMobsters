package com.managers
{
	import com.adobe.nativeExtensions.AppPurchase;
	import com.adobe.nativeExtensions.AppPurchaseEvent;
	import com.adobe.nativeExtensions.Product;
	import com.adobe.nativeExtensions.Transaction;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import mx.collections.ArrayCollection;
	
	
	public class TransactionManager extends EventDispatcher
	{
		private static var instance:TransactionManager;
		
		public static const PACK_PURCHASED:String = "packPurchased";
		public static const PURCHASE_FAILED:String = "purchaseFailed";
		public static const RESTORE_FAILED:String = "restoreFailed";
		public static const PRODUCTS_RECEIVED:String = "productsReceived";
		
		public var arrC:ArrayCollection;
			
		public function TransactionManager(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public static function getInstance():TransactionManager
		{
			if(instance == null){
				instance = new TransactionManager();
			}
			return instance;
		}
		
		public function getMutedStatus():Boolean
		{
			return (AppPurchase.manager.muted);
		}
		public function init():void
		{
			AppPurchase.manager.addEventListener(AppPurchaseEvent.RESTORE_FAILED,function(e:AppPurchaseEvent):void{
				trace("Restore failed:" + e.error);
				dispatchEvent(new Event(RESTORE_FAILED));
			});
			
			AppPurchase.manager.addEventListener(AppPurchaseEvent.RESTORE_COMPLETE,function(e:AppPurchaseEvent):void{
				trace("Restore COMPLETE");
				
			});
			AppPurchase.manager.addEventListener(AppPurchaseEvent.REMOVED_TRANSACTIONS,function(e:AppPurchaseEvent):void{
				trace("Removed transactions");
				for each(var t:Transaction in e.transactions){
					trace ("Removed: " + t.transactionIdentifier);
				}
			})
			AppPurchase.manager.restoreTransactions();
			getProducts();
		}
		
		private function getProducts():void
		{
			AppPurchase.manager.addEventListener(AppPurchaseEvent.PRODUCTS_RECEIVED,onProductRecieved);
			AppPurchase.manager.getProducts(["com.mangogames.mumbaimobsters.cashpack1","com.mangogames.mumbaimobsters.cashpack2", "com.mangogames.mumbaimobsters.cashpack3","com.mangogames.mumbaimobsters.cashpack4"]);
		}
		
		public function onProductRecieved(e:AppPurchaseEvent):void
		{
			trace("Products received");
			var productsArray:Array = e.products;
			productsArray.sortOn("price", Array.NUMERIC);
			arrC = new ArrayCollection(e.products);
			dispatchEvent(new Event(PRODUCTS_RECEIVED));
		}
		
		public function startPayment(identifier:String):void
		{
			AppPurchase.manager.addEventListener(AppPurchaseEvent.UPDATED_TRANSACTIONS,onUpdate);
			AppPurchase.manager.startPayment(identifier,1);
		}
		
		protected function onUpdate(e:AppPurchaseEvent):void{
			trace("APP - onUpdate");
			for each(var t:Transaction in e.transactions){ // Iterate over transactions whose status changed
				if(t.state == Transaction.TRANSACTION_STATE_PUCHASED){
					// Verify that this receipt came from apple and is not forged
					var req:URLRequest = new URLRequest("https://sandbox.itunes.apple.com/verifyReceipt");
					req.method = URLRequestMethod.POST;
					req.data = "{\"receipt-data\" : \""+ t.receipt +"\"}";
					var ldr:URLLoader = new URLLoader(req);
					ldr.load(req);
					ldr.addEventListener(Event.COMPLETE,function(e:Event):void{
						AppPurchase.manager.removeEventListener(AppPurchaseEvent.UPDATED_TRANSACTIONS,onUpdate);
						trace("LOAD COMPLETE: " + ldr.data); // status property in retrieved JSON is 0 then success
						// Provide the purchased functionality/service/product/subscription to user.
						dispatchEvent(new Event(PACK_PURCHASED));
						AppPurchase.manager.finishTransaction(t.transactionIdentifier); // Finish the transaction completely
					});
				}else if(t.state == Transaction.TRANSACTION_STATE_RESTORED){
					// Useful for restoring Non-Consumable purchases made by user. Read programming guide for more details.
					if(t.originalTransaction.state == Transaction.TRANSACTION_STATE_PUCHASED){
						//AppPurchase.manager.finishTransaction(t.originalTransaction.transactionIdentifier);
						trace("Restored Transaction Finish on " + t.transactionIdentifier);
					}
				}else if(t.state == Transaction.TRANSACTION_STATE_FAILED){
					dispatchEvent(new Event(PURCHASE_FAILED));
				}
			}
		}
	}
}