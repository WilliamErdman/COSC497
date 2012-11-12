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
	import flash.media.Sound;
	import flash.media.SoundMixer;

	public class Player extends Sprite
	{
		private const SPEED:int = 100;
		
		public var texture : Bitmap;
		
		private static var ready: Boolean = false;
		private static var spawnTime: uint;


		/// CTOR
		public function Player() 
		{
			var g:Graphics = this.graphics;	
			g.beginFill( 0x000000 );
			g.drawRect(0, 0, 15, 15);
			g.endFill();
			
			texture = new Resources.spyForward();
			
			spawnTime = (TimeCounter.frameCount + 10);
			ready = false;
		}


		/// Per frame update
		public function update(guards:Vector.<Guard> ) :Boolean
		{			
			const MIN_COLLISION_CHECK_PIXELS:int = 70;
			
			if ( Input.getKey( Keyboard.S ) || Input.getKey( Keyboard.DOWN ) )
			{
				this.y += SPEED * TimeCounter.deltaTime;
				Global.yVelocity = 1;
			}
			if ( Input.getKey( Keyboard.W ) || Input.getKey( Keyboard.UP ) )
			{
				this.y -= SPEED * TimeCounter.deltaTime;
				Global.yVelocity = -1;
			}

			if ( Input.getKey( Keyboard.D ) || Input.getKey( Keyboard.RIGHT ) )
			{
				this.x += SPEED * TimeCounter.deltaTime;
				Global.xVelocity = 1;
			}
			if ( Input.getKey( Keyboard.A ) || Input.getKey( Keyboard.LEFT) )
			{
				this.x -= SPEED * TimeCounter.deltaTime;
				Global.xVelocity = -1;
			}
				
			texture.x = (x);
			texture.y = (y);
			
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
			removeEventListener(Event.ENTER_FRAME, onFrame);
			
			Global.caught = true;
		}

	}

}