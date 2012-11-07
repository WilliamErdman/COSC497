package AwesomeEngine 
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.getTimer;
	import flash.utils.Timer;


	public class TimeCounter
	{
		/// Which tick frame
		static private var _frameCount	:uint 	= 0;
		static private var _deltaTime	:Number = 0;
		static private var now			:uint	= 0;
		static private var last			:uint 	= 0;

		//Get function any class in the code can call to figure out what frame the game is on
		static public function get frameCount():uint { return _frameCount; }
		
		/// Time in seconds since the last frame passed.
		static public function get deltaTime()	:Number { return _deltaTime; }

		/// Initialize sub-system
		//Start of each game when initialized is called counter set to zero
		static public function init( stage:Stage ):void
		{
			_frameCount = 0;
		}

		//
		//Every update frame count is increased by 1
		static public function update():void
		{
			now = getTimer();

			_frameCount++;
			_deltaTime = (now - last) / 1000; 

			last = now;
		}
	}

}