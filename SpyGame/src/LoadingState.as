package  
{
	import AwesomeEngine.*;
	import flash.display.SimpleButton;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	
	public class LoadingState implements IState
	{
		private var player  :Player;
		private var guards  :Vector.<Guard>;
		
		public function LoadingState() 
		{
			
		}
		
		public function start():void
		{
			Global.caught = false;
			Global.win = false;
			
			var tf  :TextField;
			
			tf = maketf();
			tf.text = "YOU DIED!";
			tf.y = 10;
			Display.ui.addChild( tf );
			
			tf = maketf();
			tf.text = "LIVES: " + Global.lives;
			tf.y = 70;
			Display.ui.addChild( tf );
			
			var button :Sprite;
			
			button = makeButton("Press SPACE 2 Reset", clickPlay );
			Display.ui.addChild( button );
			button.x = 5;
			button.y = 150;
		}
		
		public function update(): void
		{
			if (Input.getKeyDown( Keyboard.SPACE))
			{
				State.current = new GameState();
			} 
		}
		
		public function end(): void
		{
			Display.clear();
		}
		
		public function clickPlay ( button:ButtonPure ):void
		{
			trace("ShellState: play");
			
			State.current = new GameState();
		}	
		
	}

}