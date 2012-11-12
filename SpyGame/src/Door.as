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
	
	public class Door extends Sprite
	{
		
		public var texture : Bitmap;
		
		public function Door() 
		{
			var g:Graphics = this.graphics;	
			g.beginFill( 0x00fefe);
			g.drawRect(0, 0, 30, 30);
			g.endFill();
			
			texture = new Resources.door();
		}
		
		public function update( player: Player ) :Boolean
		{			
			const MIN_COLLISION_CHECK_PIXELS:int = 64;
				
				if ( Math.abs( this.x - player.x ) < MIN_COLLISION_CHECK_PIXELS ||
					 Math.abs( this.y - player.y ) < MIN_COLLISION_CHECK_PIXELS )
				{
					if ( this.hitTestObject( player ) )
					{
						startExplosion();
						return true;
					}
				}
				
			texture.x = (x);
			texture.y = (y);

			return false;
		}
		
		private function startExplosion():void
		{
			addEventListener( Event.ENTER_FRAME, onFrame );
		}

		private function onFrame( e:Event ):void
		{
			removeEventListener(Event.ENTER_FRAME, onFrame);
			
			Global.win = true;
		}

	}

}