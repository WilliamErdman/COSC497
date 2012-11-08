package  
{
	import AwesomeEngine.IDisposable;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Vector3D;
	import flash.display.Bitmap;
	
	/**
	 * ...
	 * @author William A Erdman
	 */
	public class Guard extends Sprite
	{
		public var texture: Bitmap;
		
		public function Guard( target:Sprite ) 
		{
			var g:Graphics = this.graphics;	
			g.beginFill( 0x33ee22 );
			g.drawRect(0, 0, 30, 30);
			g.endFill();
			
			texture = new Resources.guardBMP();
		}
		
		public function update(): void
		{
			const MIN_COLLISION_CHECK_PIXELS:int = 64;
			
			texture.x = (x - 25);
			texture.y = (y - 25);
		}
	}

}