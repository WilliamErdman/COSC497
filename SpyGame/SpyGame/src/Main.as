package 
{
	import AwesomeEngine.*;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Graphics;
	
	/**
	 * ...
	 * @author William A Erdman
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			Systems.init( stage );
			
			Global.level = 1;
			Global.lives = 3;
			
			State.current = new GameState();
			
			addEventListener( Event.ENTER_FRAME, update );
		}
		
		private function update( e:Event ):void
		{
			TimeCounter.update();
			Input.update();
			State.update();
		}
		
	}
	
}