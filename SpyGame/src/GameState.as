package  
{
	import AwesomeEngine.*;
	import flash.geom.Point;
	
	public class GameState implements IState
	{
		private var player  :Player;
		private var door    :Door;
		private var walls   :Vector.<Wall>;
		private var guards  :Vector.<Guard>;
		
		public function GameState() 
		{
		}
		
		public function start(): void
		{			
			player = new Player();
			Display.main.addChild( player );
			
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
			
			player.x = 730;
			player.y = 540;
			
			walls = new Vector.<Wall>;
			var wall :Wall;
			if (Global.level == 1)
			{
				//box walls
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 0;
				wall.y = 0;
				wall.start( 25, 575);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 0;
				wall.y = 0;
				wall.start( 800, 25);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 0;
				wall.y = 575;
				wall.start( 800, 25);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 775;
				wall.y = 0;
				wall.start( 25, 775);
				
				//per level
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 650;
				wall.y = 440;
				wall.start( 20, 140);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 650;
				wall.y = 250;
				wall.start( 20, 140);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 650;
				wall.y = 250;
				wall.start( 90, 20);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 300;
				wall.y = 160;
				wall.start( 600, 20);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 400;
				wall.y = 220;
				wall.start( 150, 20);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 400;
				wall.y = 160;
				wall.start( 20, 300);
			}
			
			guards = new Vector.<Guard>;
			var guard:Guard;
			if (Global.level == 1)
			{
				//guard 1 level 1
				guard = new Guard( player );
				guards.push(guard);
				Display.main.addChild( guard );
				guard.x = 640;
				guard.y = 420;
				
				//guard 2 level 1
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard );
				guard.x = 710;
				guard.y = 350;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard );
				guard.x = 740;
				guard.y = 190;
			}
		}
		
		public function update(): void
		{				
			var len2:int = walls.length;
			for (var t:int = len2 - 1; t >= 0; t--)
			{
				walls[t].update( player );
			}
			
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
			player.update( guards );
			
			door.update( player );
		}
		
		public function end(): void
		{
			var len:int = guards.length;
			for ( var i:int = len - 1; i >= 0; i-- )
			{
				( guards.splice( i, 1 )[0] );
			}
				
			Display.clear();
		}
		
	}

}