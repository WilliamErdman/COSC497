package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author William A Erdman
	 */
	public class Resources 
	{
		
		[Embed(source="../lib/enemyBlueDown.png")] static public var blueDown:Class;
		[Embed(source="../lib/enemyBlueLeft.png")] static public var blueLeft:Class;
		[Embed(source="../lib/enemyBlueRight.png")] static public var blueRight:Class;
		[Embed(source = "../lib/enemyBlueUp.png")] static public var blueUp:Class;
		
		[Embed(source="../lib/enemyRedDown.png")] static public var redDown:Class;
		[Embed(source="../lib/enemyRedLeft.png")] static public var redLeft:Class;
		[Embed(source="../lib/enemyRedRight.png")] static public var redRight:Class;
		[Embed(source = "../lib/enemyRedUp.png")] static public var redUp:Class;
		
		[Embed(source="../lib/ufoBlueDown.png")] static public var ufoBlueDown:Class;
		[Embed(source="../lib/ufoBlueLeft.png")] static public var ufoBlueLeft:Class;
		[Embed(source="../lib/ufoBlueRight.png")]static public var ufoBlueRight:Class;
		[Embed(source="../lib/ufoBlueStill.png")]static public var ufoBlueStill:Class;
		[Embed(source="../lib/ufoBlueUp.png")]static public var ufoBlueUp:Class;
		
		[Embed(source="../lib/ufoRedDown.png")]static public var ufoRedDown:Class;
		[Embed(source="../lib/ufoRedLeft.png")]static public var ufoRedLeft:Class;
		[Embed(source="../lib/ufoRedRight.png")]static public var ufoRedRight:Class;
		[Embed(source="../lib/ufoRedStill.png")]static public var ufoRedStill:Class;
		[Embed(source = "../lib/ufoRedUp.png")]static public var ufoRedUp:Class;
		
		static public var ufo: MovieClip = new UFO;
		
		static public function init():void
		{
			
		}
		
	}

}