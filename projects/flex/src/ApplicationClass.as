package
{
	import mx.core.Application;
	import mx.events.FlexEvent;
	import org.hasseg.externalMouseWheel.ExternalMouseWheelSupport;
	import flash.display.StageDisplayState;
	
	public class ApplicationClass extends Application
	{
		//---------------------------------------
		// CONSTRUCTOR
		//---------------------------------------
		public function ApplicationClass()
		{
			addEventListener( FlexEvent.APPLICATION_COMPLETE, applicationComplete );
		}

		//---------------------------------------
		// PRIVATE METHODS
		//---------------------------------------
		private function applicationComplete( event : FlexEvent ):void
		{
			removeEventListener( FlexEvent.APPLICATION_COMPLETE, applicationComplete);
			
			// Add mouse support
			var _mwSupport:ExternalMouseWheelSupport = ExternalMouseWheelSupport.getInstance(stage);
			_mwSupport.dispatchingObjectDeterminationMethod = ExternalMouseWheelSupport.TRAVERSE_DISPLAY_LIST;
		}
		
		//---------------------------------------
		// PROTECTED METHODS
		//---------------------------------------
		protected function toggleFullScreen():void
		{
			try
			{
				switch (systemManager.stage.displayState)
				{
					case StageDisplayState.FULL_SCREEN:
						/* If already in full screen mode, switch to normal mode. */
						systemManager.stage.displayState = StageDisplayState.NORMAL;
						break;
					default:
						/* If not in full screen mode, switch to full screen mode. */
						systemManager.stage.displayState = StageDisplayState.FULL_SCREEN;
						break;
				}
			}
			catch (err:SecurityError)
			{}
		}
	}
}