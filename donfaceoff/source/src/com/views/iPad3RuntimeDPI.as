package com.views
{
	import flash.system.Capabilities;
	
	import mx.core.DPIClassification;
	import mx.core.RuntimeDPIProvider;
	
	public class iPad3RuntimeDPI extends RuntimeDPIProvider
	{
		public function iPad3RuntimeDPI()
		{
			super();
		}
		
		override public function get runtimeDPI():Number
		{
			var os:String = Capabilities.os;
			
			if(os.indexOf("iPad") != -1)
			{
				trace("Ipad");
				if(Capabilities.screenResolutionX > 2000 || Capabilities.screenResolutionY > 2000)
				{
					return DPIClassification.DPI_320;
				} else {
					return DPIClassification.DPI_320;
				}
			} else {
				trace("Capabilities.screenDPI:"+Capabilities.screenDPI);
				return DPIClassification.DPI_320;
				//return Capabilities.screenDPI;
			}
			return 240;
		}
	}
}