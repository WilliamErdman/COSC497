package
{
	import AwesomeEngine.*;
	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.ui.Keyboard;
	import flash.events.Event;
	
	public class Wall extends Sprite
	{
		private const SPEED:int = 100;
		
		public function Wall( )
		{
			
		}
		
		public function start( width: uint, height: uint): uint
		{
			var g:Graphics = this.graphics;	
			g.beginFill( 0x335271);
			g.drawRect(0, 0, width, height);
			g.endFill();
			
			return 4333;
		}
		
		public function update( player: Player ) :Boolean
		{			
			const MIN_COLLISION_CHECK_PIXELS:int = 64;
			
			if ( Math.abs( this.x - player.x ) < MIN_COLLISION_CHECK_PIXELS ||
					 Math.abs( this.y - player.y ) < MIN_COLLISION_CHECK_PIXELS )
				{
					if ( this.hitTestObject( player ) )
					{
						if (Global.xVelocity > 0)
						player.x -= (20 + 2);
						else if (Global.xVelocity < 0)
						player.x += (20 + 2);
						
						if (Global.yVelocity < 0)
						player.y += (20 + 2);
						else if (Global.yVelocity > 0)
						player.y -= (20 + 2);
					}
				}
			
			return false;
		}
		
		private function startExplosion():void
		{
			//addEventListener( Event.ENTER_FRAME, onFrame );
		}
	}

}