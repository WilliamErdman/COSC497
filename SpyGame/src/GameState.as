package  
{
	import AwesomeEngine.*;
	import flash.geom.Point;
	
	public class GameState implements IState
	{
		private var player  :Player;
		private var door    :Door;
		private var guards  :Vector.<Guard>;
		
		public function GameState() 
		{
		}
		
		public function start(): void
		{
			player = new Player();
			Display.main.addChild( player.texture );
			
			door = new Door();
			Display.main.addChild( door );
			
			if (Global.level == 1)
			{
			    door.x = 50;
				door.y = 50;
			}
			if (Global.level == 2)
			{
			    door.x = 100;
				door.y = 100;
			}
			if (Global.level == 3)
			{
			    door.x = 150;
				door.y = 150;
			}
			
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
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 400;
				guard.y = 400;
			}
		}
		
		public function update(): void
		{
			player.update( guards );
			
			door.update( player );
			
			var len:int = guards.length;
			for ( var i:int = len - 1; i >= 0; i--)
			{
				guards[i].update();
			}
			
			if (Global.caught == true)
			{
				if (Global.lives > 0)
				{
				Global.lives--;
				State.current = new LoadingState();
				}
				else if (Global.lives <= 0)
				{
					State.current = new LoseState();
				}
			}
			
			if (Global.win == true)
			{
				if (Global.level < 3)
				{
				Global.level++;
				State.current = new LoadingState();
				}
				else if (Global.level >= 3)
				{
					State.current = new WinState();
				}
			}
		}
		
		public function end(): void
		{
			Display.clear();
		}
		
	}

}