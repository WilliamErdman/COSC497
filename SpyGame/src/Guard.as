package  
{
	import AwesomeEngine.IDisposable;
	import AwesomeEngine.TimeCounter;
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
		public var isPacingY: Boolean = false;
		public var isPacingX: Boolean = false;
		public var baseX: int;
		public var baseY: int;
		public var paceMultiplier: int;
		
		public function Guard( target:Sprite ) 
		{
			var g:Graphics = this.graphics;	
			g.beginFill( 0x33ee22 );
			g.drawRect(0, 0, 30, 30);
			g.endFill();
			
			texture = new Resources.guardBMP();
		}
		
		public function pacingX( pacingX: Boolean, startX: int, startY: int, paceValue: int): Boolean
		{
			isPacingX = pacingX;
			
			baseX = startX;
			baseY = startY;
			
			paceMultiplier = paceValue;
			
			return isPacingX;
		}
		
		public function pacingY(pacingY: Boolean, startX: int, startY: int, paceValue: int): Boolean
		{
			isPacingY = pacingY;
			
			baseX = startX;
			baseY = startY;
			
			paceMultiplier = paceValue;
			
			return isPacingY;
		}
		
		public function update(): void
		{
			const MIN_COLLISION_CHECK_PIXELS:int = 64;
			
			if (isPacingY == true)
			{
				y = (baseY + (Math.sin(TimeCounter.frameCount * .1) * paceMultiplier));
			}
			
			if (isPacingX == true)
			{
				x = (baseX + (Math.sin(TimeCounter.frameCount * .1) * paceMultiplier));
			}
			
			texture.x = (x );
			texture.y = (y);
		}
	}

}