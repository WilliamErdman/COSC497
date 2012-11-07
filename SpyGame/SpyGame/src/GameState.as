package  
{
	import AwesomeEngine.*;
	import flash.geom.Point;
	
	public class GameState implements IState
	{
		private var player  :Player;
		private var guards  :Vector.<Guard>;
		
		public function GameState() 
		{
		}
		
		public function start(): void
		{
			player = new Player();
			player.x = 650;
			player.y = 500;
			Display.main.addChild( player.texture );
			
			guards = new Vector.<Guard>;
			var guard:Guard;
			if (Global.level == 1)
			{
				//guard 1 level 1
				guard = new Guard( player );
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 300;
				guard.y = 300;
				
				//guard 2 level 1
				guard = new Guard( player );
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 400;
				guard.y = 400;
			}
		}
		
		public function update(): void
		{
			player.update( guards );
			
			var len:int = guards.length;
			for ( var i:int = len - 1; i >= 0; i--)
			{
				guards[i].update();
			}
			
			if (Global.caught == true)
			{
				State.current = new LoadingState();
			}
		}
		
		public function end(): void
		{
			Display.clear();
		}
		
	}

}