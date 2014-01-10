package utils
{
	import flash.system.Capabilities;
	import mx.core.DPIClassification;
	import mx.core.RuntimeDPIProvider;
	import mx.core.UIComponent;
	
	
	//Sets up 320 DPI for iPads and iPhones for retina display
	public class CustomRuntimeDPIProvider extends RuntimeDPIProvider
	{
		protected var _target:UIComponent;
		
		public function CustomRuntimeDPIProvider()
		{
			super();
		}
		
		override public function get runtimeDPI():Number 			
		{	
			if (Capabilities.version.substr(0, 3).toLowerCase() == "ios")
			{		
				if(Capabilities.screenResolutionX > 2000 || Capabilities.screenResolutionY > 1400)				
				{			
					return DPIClassification.DPI_320;			
				}	
				if (Capabilities.screenResolutionX == 640 && Capabilities.screenResolutionY >= 960)
				{				
					return DPIClassification.DPI_320;
				}				
				else
				{
				 return Capabilities.screenDPI;
				}
			}
			return Capabilities.screenDPI;
		}
	}	
}
