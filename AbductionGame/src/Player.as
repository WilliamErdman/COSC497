package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	import utils.Display;
	import utils.Input;


	/**
	 * ...
	 */
	public class Player 
	{
		public var x			: Number = 0;
		public var y			: Number = 0;		
		public var halfWidth	: Number = 30;
		public var halfHeight	: Number = 30;
		public var color		: uint = 0xff0000;
		
		public var texture      : MovieClip;


		/// CTOR
		public function Player() 
		{
			// Start player 75% of the way across the screen and
			// half way (50%) down the screen.

			x = Display.width * 0.75;
			y = Display.height * 0.5;
			
			texture = new UFO;
			texture.stop();
		}



		public function update():void
		{
			// Check input if movement should occur.
			if ( Input.isDown( Keyboard.DOWN ) ) 	
			{
				y += 10;
				if (color == 0xff0000)
					texture.gotoAndStop(5);
				else
					texture.gotoAndStop(10);
			}
			if ( Input.isDown( Keyboard.UP ) )
			{
				y -= 10;
				if (color == 0xff0000)
					texture.gotoAndStop(2);
				else
					texture.gotoAndStop(7);
			}
			if ( Input.isDown( Keyboard.LEFT ) )
			{
				x -= 10;
				if (color == 0xff0000)
					texture.gotoAndStop(3);
				else
					texture.gotoAndStop(8);
			}
			if ( Input.isDown( Keyboard.RIGHT ) )
			{
				x += 10;
				if (color == 0xff0000)
					texture.gotoAndStop(4);
				else
					texture.gotoAndStop(9);
			}
			
			texture.x = (x);
			texture.y = (y);
			
			// Change color
			if ( Input.isDown( Keyboard.Z ) )
			{
				color = 0xff0000;
				texture.gotoAndStop(1);
			}
			if ( Input.isDown( Keyboard.X ) )		
			{
				color = 0x0000ff;
				texture.gotoAndStop(6);
			}

		}


		/// Simple AABB collision 
		public function isColliding( enemy:Enemy ) :Boolean
		{			
			// First check horizontal...
			var length	: Number = halfWidth + enemy.halfWidth;	// minimum distance between centers before collision
			var diff	: Number = Math.abs( x - enemy.x);		// actual distance between centers

			if ( diff < length )
			{
				// Horizon is overlapping, now check vertical.

				length 	= halfHeight + enemy.halfHeight;
				diff	= Math.abs( y - enemy.y );

				// If vertically shorter, there is collision
				if ( diff < length )
					return true;
			}

			return false;
		}

	}

}