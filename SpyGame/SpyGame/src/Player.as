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

	public class Player extends Sprite
	{
		private const SPEED:int = 100;
		
		public var texture : Bitmap;
		
		public static var health: int = 1;


		/// CTOR
		public function Player() 
		{
			var g:Graphics = this.graphics;	
			g.beginFill( 0xffffff );
			g.drawRect(0, 0, 20, 20);
			g.endFill();
			
			texture = new Resources.spyBMP();
			
			this.x = 650;
			this.y = 500;
		}


		/// Per frame update
		public function update(guards:Vector.<Guard> ) :Boolean
		{			
			const MIN_COLLISION_CHECK_PIXELS:int = 64;
			
			if ( Input.getKey( Keyboard.S ) || Input.getKey( Keyboard.DOWN ) )
				this.y += SPEED * TimeCounter.deltaTime;
			if ( Input.getKey( Keyboard.W ) || Input.getKey( Keyboard.UP ) )
				this.y -= SPEED * TimeCounter.deltaTime;

			if ( Input.getKey( Keyboard.D ) || Input.getKey( Keyboard.RIGHT ) )
				this.x += SPEED * TimeCounter.deltaTime;
			if ( Input.getKey( Keyboard.A ) || Input.getKey( Keyboard.LEFT) )
				this.x -= SPEED * TimeCounter.deltaTime;
				
			texture.x = (x - 10);
			texture.y = (y - 10);
			
			var len:int  = guards.length;
			var guard:Guard;
			for ( var i:int = len - 1; i >= 0; i-- )
			{
				guard = guards[i];	
				
				if ( Math.abs( this.x - guard.x ) < MIN_COLLISION_CHECK_PIXELS ||
					 Math.abs( this.y - guard.y ) < MIN_COLLISION_CHECK_PIXELS )
				{
					if ( this.hitTestObject( guard ) )
					{
						startExplosion();
						return true;
					}
				}
			}

			return false;
		}
		
		private function startExplosion():void
		{
			addEventListener( Event.ENTER_FRAME, onFrame );
		}

		private function onFrame( e:Event ):void
		{
			Global.caught = true;
		}

	}

}