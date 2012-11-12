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
			Display.main.addChild( player.texture );
			
			door = new Door();
			Display.main.addChild( door.texture );
			
			if (Global.level == 1)
			{
			    door.x = 270;
				door.y = 160;
			}
			if (Global.level == 2)
			{
			    door.x = 745;
				door.y = 25;
			}
			if (Global.level == 3)
			{
			    door.x = 380;
				door.y = 25;
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
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 250;
				wall.y = 160;
				wall.start( 20, 415);
			}
			else if (Global.level == 2)
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
				
				//Per Level
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 100;
				wall.y = 450;
				wall.start( 775, 20);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 100;
				wall.y = 100;
				wall.start( 20, 350);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 700;
				wall.y = 0;
				wall.start( 20, 380);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 100;
				wall.y = 100;
				wall.start( 480, 20);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 190;
				wall.y = 360;
				wall.start( 530, 20);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 190;
				wall.y = 230;
				wall.start( 460, 20);
			}
			else if (Global.level == 3)
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
				
				//Per Level
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 700;
				wall.y = 0;
				wall.start(20, 300);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 700;
				wall.y = 350;
				wall.start(20, 300);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 550;
				wall.y = 280;
				wall.start(150, 20);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 350;
				wall.y = 280;
				wall.start(150, 20);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 550;
				wall.y = 380;
				wall.start(150, 20);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 350;
				wall.y = 380;
				wall.start(150, 20);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 480;
				wall.y = 200;
				wall.start(20, 100);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 480;
				wall.y = 200;
				wall.start(150, 20);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 480;
				wall.y = 0;
				wall.start(20, 150);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 610;
				wall.y = 60;
				wall.start(20, 150);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 100;
				wall.y = 130;
				wall.start(400, 20);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 340;
				wall.y = 280;
				wall.start(20, 120);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 480;
				wall.y = 400;
				wall.start(20, 120);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 100;
				wall.y = 325;
				wall.start(260, 20);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 100;
				wall.y = 200;
				wall.start(260, 20);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 100;
				wall.y = 390;
				wall.start(20, 100);
				
				wall = new Wall();
				walls.push(wall);
				Display.main.addChild( wall );
				wall.x = 100;
				wall.y = 470;
				wall.start(250, 20);
			}
			
			guards = new Vector.<Guard>;
			var guard:Guard;
			if (Global.level == 1)
			{
				//guard 1 level 1
				guard = new Guard( player );
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 640;
				guard.y = 420;
				
				//guard 2 level 1
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 710;
				guard.y = 350;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 740;
				guard.y = 190;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x =470;
				guard.y = 470;
				guard.pacingY(true, guard.x, guard.y, 50);
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 380;
				guard.y = 490;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 320;
				guard.y = 300;
				guard.pacingX(true, guard.x, guard.y, 50);
			}
			else if (Global.level == 2)
			{
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 500;
				guard.y = 500;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 200;
				guard.y = 500;
				guard.pacingX(true, guard.x, guard.y, 100);
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 150;
				guard.y = 230;
				guard.pacingY(true, guard.x, guard.y, 100);
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 250;
				guard.y = 150;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 400;
				guard.y = 130;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 480;
				guard.y = 160;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 400;
				guard.y = 300;
				guard.pacingX(true, guard.x, guard.y, 100);
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 300;
				guard.y = 260;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 530;
				guard.y = 320;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 510;
				guard.y = 420;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 570;
				guard.y = 380;
			}
			else if (Global.level == 3)
			{
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 630;
				guard.y = 310;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 500;
				guard.y = 325;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 580;
				guard.y = 460;
				guard.pacingX(true, guard.x, guard.y, 70);
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 530;
				guard.y = 540;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 580;
				guard.y = 460;
				guard.pacingX(true, guard.x, guard.y, 70);
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 200;
				guard.y = 350;
				guard.pacingX(true, guard.x, guard.y, 70);
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 400;
				guard.y = 470;
				guard.pacingY(true, guard.x, guard.y, 60);
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 570;
				guard.y = 250;
				guard.pacingX(true, guard.x, guard.y, 70);
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 370;
				guard.y = 200;
				guard.pacingY(true, guard.x, guard.y, 50);
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 200;
				guard.y = 255;
				guard.pacingY(true, guard.x, guard.y, 35);
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 60;
				guard.y = 255;
				guard.pacingY(true, guard.x, guard.y, 100);
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 640;
				guard.y = 170;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 550;
				guard.y = 100;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 530;
				guard.y = 160;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 440;
				guard.y = 240;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 300;
				guard.y = 260;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 130;
				guard.y = 240;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 210;
				guard.y = 145;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 500;
				guard.y = 50;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 100;
				guard.y = 50;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 150;
				guard.y = 100;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 200;
				guard.y = 430;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 300;
				guard.y = 390;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 300;
				guard.y = 540;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 230;
				guard.y = 500;
				
				guard = new Guard( player);
				guards.push(guard);
				Display.main.addChild( guard.texture );
				guard.x = 60;
				guard.y = 480;
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
				return;
				}
				else if (Global.lives <= 0)
				{
					State.current = new LoseState();
					return;
				}
			}
			
			if (Global.win == true)
			{
				if (Global.level < 3)
				{
				Global.level++;
				State.current = new LoadingStateLevel();
				return;
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