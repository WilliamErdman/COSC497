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
	
	public class LoseState implements IState
	{
		
		public function LoseState() 
		{
			
		}
		
		public function start():void
		{
			Global.lives = 3;
			Global.caught = false;
			
			var tf  :TextField;
			
			tf = maketf();
			tf.text = "Mission Scrubed";
			tf.y = 10;
			Display.ui.addChild( tf );
			
			var button :Sprite;
			
			button = makeButton("Main Menu", clickPlay );
			Display.ui.addChild( button );
			button.x = 5;
			button.y = 150;
			
		}
		
		public function update(): void
		{
			if (Input.getKeyDown( Keyboard.ESCAPE))
			{
				State.current = new ShellState();
			} 
		}
		
		public function end():void
		{
			Display.clear();
		}
		
		public function clickPlay ( button:ButtonPure ):void
		{
			trace("ShellState: play");
			
			State.current = new ShellState();
		}	
		
	}

}