package  
{
	import AwesomeEngine.IState;
	import AwesomeEngine.*;
	import flash.geom.Point;
	/**
	 * ...
	 * @author William A Erdman
	 */
	public class LoadingState implements IState
	{
		
		public function LoadingState() 
		{
			
		}
		
		public function start():void
		{
			Global.caught = false;
			Global.level = Global.level;
			Global.lives = Global.lives;
		}
		
		public function update(): void
		{			
			State.current = new GameState();
		}
		
		public function end(): void
		{
			Display.clear();
		}
		
	}

}