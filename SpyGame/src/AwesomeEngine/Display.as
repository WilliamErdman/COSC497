package AwesomeEngine 
{
	import flash.display.Sprite;
	import flash.display.Stage;


	/**
	 * Globally accessible information about the display (aka: stage)
	 */
	public class Display 
	{
		static public var width	: uint;
		static public var height: uint;

		static public var main	: Sprite;
		static public var ui	: Sprite;

		static private var isInit:Boolean = false;


		static public function init( stage:Stage ):void
		{
			// Set the global display properties.
			width 	= stage.stageWidth;
			height	= stage.stageHeight;

			// Check if this is a re-initialization; if so remove any contents from stage.
			//if ( isInit )
			while (stage.numChildren > 0) stage.removeChildAt(0);

			// Create sprites for all pieces of the game to draw to; and one for instructions.
			main	= new Sprite();
			ui		= new Sprite();

			// Adding ui last so it will be draw later than anything
			// put on the game layer.
			stage.addChild( main );
			stage.addChild( ui );

			isInit = true;
		}
		
		/// Clear all
		static public function clear() :void
		{
			while (main.numChildren > 0) main.removeChildAt(0);
			while (ui.numChildren > 0) ui.removeChildAt(0);
		}

	}

}