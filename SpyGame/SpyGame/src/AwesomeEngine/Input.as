package AwesomeEngine 
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.KeyLocation;
	import flash.ui.Mouse;

	public class Input 
	{
		//Sets up various key states for engine to use
		//Numbers are arbitrary, can be rearrange if desired
		static private const UP : uint = 0;
		static private const PRESS : uint = 1;
		static private const HELD : uint = 2;
		static private const DOUBLE: uint = 3;

		//Hold triggers right after press
		//Could be annoying for a game
		//Gonna add a pause state between PRESS and HOLD
		static private const PAUSE: uint = 4;

		//Variables for double click
		static private var doubleTimer: uint = 0;
		static private var doubleReady: Boolean = false;

		//Add definition later when better understood why start at 9999 && why needed
		//
		static private const START_PRESS:uint = 9999;
		static private const START_DOUBLE:uint = 9998;

		//A vector (array) for keys that'll be used
		static private var keys : Vector.<uint>;
		//will be used to check for double press
		static private var prevKey : Vector.<uint>;

		//A custom vector for keystates,
		static private var active : Vector.<KeyState>;

		//Need to figure out what key value is for Mouse Buttons, then can add to key array and make easy
		//Pass var value to keys[261] && keys[262], not sure how will access outside file
		//Mights just add more public get values at bottom for seperate Mouse calls done in code when mouse is
		//pressed, otherwords when certain keys are pressed
		//static public const mouseButtonL : uint =  KeyLocation.LEFT;

		static public function init( stage:Stage ):void
		{
			stage.removeEventListener( KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);

			//Sets up keys from keyboard for input
			//255 number of keys on keyboard, add more to incorporate other input sources
			//256 - 260 blank references, 262 and 263 are for mouse buttons
			keys = new Vector.<uint>(262);
			//Gets states of keys in states other than up
			active = new Vector.<KeyState>();

			//onKeyDown && onKeyUp are functions called later in code
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}

		//For when a key is just pressed
		//Pass hold and tap from here
		static public function onKeyDown(e:KeyboardEvent):void
		{	

			//If getting another key down event but the key is marked as another
			//state than down; ignore it
			if (keys[e.keyCode] != UP)
				return;

			if (doubleReady == false)
			{
				keys[e.keyCode] = START_PRESS;
				prevKey = keys;
			}
			else if (doubleReady == true && (keys == prevKey))
			{
				keys[e.keyCode] = START_DOUBLE;
			}
			else if (doubleReady == true && (keys != prevKey))
			{
				keys[e.keyCode] = START_PRESS;
				prevKey = keys;
			}

			var keyState:KeyState = new KeyState(e.keyCode, TimeCounter.frameCount);
			active.push(keyState);
		}

		static public function onKeyUp(e:KeyboardEvent):void
		{
			keys[e.keyCode] = UP;

			// Loop through all active keys; there is a slight chance that
			// more than one entry for a key being "down" snuck in due to
			// how Flash / OS handles input. (Copied from class code)
			var keyState:KeyState;
			for ( var i:int = active.length - 1; i > -1; i-- )
			{
				keyState = active[i];				// get next keystate in active list
				if ( keyState.code == e.keyCode )	// if the code matches
					active.splice( i, 1 );			// remove
			}
		}

		static public function update():void
		{
			var code :uint;
			var keyState:KeyState;

			if (doubleTimer < TimeCounter.frameCount)
			{
				doubleReady = false;
			}

			//Goes through all keys marked as being  active
			for (var i:int = active.length - 1; i > -1; i--)
			{
				keyState = active[i];
				code = keyState.code;

				//If a key is pressed longer then the frame it was active
				//Change to held
				//IDEA: go from pressed to tap for approx 3-5 frames, then go to held
				//will need another if statement
				if (keys[code] == PRESS && keyState.frame < TimeCounter.frameCount)
				{
					keys[code] = PAUSE;
					keyState.frame = (TimeCounter.frameCount + 2);
					doubleTimer = (TimeCounter.frameCount + 5);
					doubleReady = true;			
					continue;
				}

				if (keys[code] == PAUSE && keyState.frame < TimeCounter.frameCount)
				{
					keys[code] = HELD;
				}

				if (keys[code] == DOUBLE && keyState.frame < TimeCounter.frameCount)
				{
					doubleReady = false;
					keys[code] = UP;
				}

				//Registers if a press is just starting, mark as started, then update
				//Sets frame for start of press to frame it is
				if (keys[code] == START_PRESS)
				{
					keys[code] = PRESS;
				}

				if (keys[code] == START_DOUBLE)
				{
					keys[code] = DOUBLE;
					keyState.frame = TimeCounter.frameCount;
				}

				//DOUBLE PRESS
				//Look through code to add statement for if key is pressed, released, and pressed
				//Within approx 5 frames then register double press, do not go to held after this

			}
		}

		//See if a key is pressed in this frame
		static public function getKeyDown(code:uint):Boolean
		{
			return keys[code] == PRESS;
		}

		//Is a key in a state other than being up?
		static public function getKey(code:uint):Boolean
		{
			return keys[code] == HELD;
		}

		static public function getDouble(code:uint):Boolean
		{
			return keys[code] == DOUBLE;
		}
	}
}

//(Copied from Class Code)
//Code to make KeyState work in vector
//Key for code to work properly
internal class KeyState
{
	public var code	:uint;
	public var frame:uint;

	/// CTOR
	function KeyState( code:uint, frame:uint ) :void
	{
		this.code 	= code;
		this.frame 	= frame;
	}
}