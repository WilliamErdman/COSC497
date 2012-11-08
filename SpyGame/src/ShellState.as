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
	
	public class ShellState implements IState
	{
		
		public function ShellState() 
		{
			
		}
		
		public function start():void
		{
			Global.level = 1;
			Global.win = false;
			Global.caught = false;
			Global.lives = 3;
			
			var tf  :TextField;
			
			tf = maketf();
			tf.text = "Main Menu";
			tf.y = 10;
			Display.ui.addChild( tf );
			
			var button :Sprite;
			
			button = makeButton("Press Space 2 Play", clickPlay );
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
		
		public function end():void
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