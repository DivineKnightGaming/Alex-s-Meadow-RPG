package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;


class BattleWindow extends FlxGroup
{
	public var enemies:Array<Enemy>;
	public var enemy1:Enemy;
	public var exar:Array<Int>;
	public var eyar:Array<Int>;
	public var ex:Int;
	public var ey:Int;
	public var numEnemies:Int;
	public var enemyList:Array<Dynamic>;
	
	public var enemyWindow:FlxSprite;
	public var playerWindow:FlxSprite;
	public var characterWindow:FlxSprite;
	public var character:FlxSprite;
	public var attacktext:FlxText;
	
	public var attackButton:FlxButton;
	public var healButton:FlxButton;
	
	public var playerHealth:Int;
	public var enemyHealth:Array<Int>;
	
	public var enemyMaxHealth:Array<Int>;
	
	public var battleStep:Int;
	public var actionSelect:Int;
	public var enemySelect:Int;
	public var battleActions:Array<String>;
	public var defending:Bool;
	public var _turnTimer:Float;
	public var turn:Int;
	public var eturn:Int;
	public var turnCount:Int;
	
	public function new(enemiesList:Array<Dynamic>, char:String)
	{
		super();
		
		enemyWindow = new FlxSprite(0, 20, Reg.dialogWindow);
		enemyWindow.x = (FlxG.width / 2) - (enemyWindow.width / 2);
		add(enemyWindow);
		
		exar = [128,0,-128,64,-64];
		eyar = [0,0,0,64,64];
		
		enemyList = enemiesList;
		numEnemies = enemiesList.length;
		enemies = new Array();
		
		var en:Int = 0;
		for (mon in enemiesList)
		{
			enemy1 = new Enemy(0, cast(enemyWindow.y + enemyWindow.height / 2 - eyar[en], Int), mon);
			enemy1.x = cast(enemyWindow.x + enemyWindow.width / 2 - enemy1.width/2 - exar[en],Int);
			enemies.push(enemy1);
			add(enemy1);
			en++;
		}
		
		playerWindow = new FlxSprite(0, 260, Reg.actionWindow);
		playerWindow.x = (FlxG.width / 2) - (playerWindow.width / 2);
		add(playerWindow);
		
		characterWindow = new FlxSprite(playerWindow.x, playerWindow.y - 30, Reg.speakerWindow);
		add(characterWindow);
		character = new FlxSprite(0, 0, char);
		character.x = (characterWindow.x + (characterWindow.width / 2)) - (character.width / 2);
		character.y = (characterWindow.y + (characterWindow.height / 2)) - (character.height / 2);
		add(character);
		
		playerHealth = Reg.playerMaxHealth;
		Reg.text = new FlxText(playerWindow.x + 100, playerWindow.y + 30, 200, "HP: "+playerHealth+"/"+Reg.playerMaxHealth);
		Reg.text.size = 30;
		Reg.text.alignment = "left";
		add(Reg.text);
		
		attackButton = new FlxButton((FlxG.width/2) - 80, playerWindow.y + 100, "Attack");
		attackButton.loadGraphic(Reg.buttonImg,false,160,40);
		attackButton.x = playerWindow.x + (playerWindow.width / 2) - (attackButton.width/2);
		attackButton.label = new FlxText(0,0,160,"Attack");
		attackButton.label.setFormat(null, 22, 0xffffff, "center");
		add(attackButton);
		
		healButton = new FlxButton((FlxG.width/2) - 80, playerWindow.y + 150, "Defend/Heal");
		healButton.loadGraphic(Reg.buttonImg,false,160,40);
		healButton.x = playerWindow.x + (playerWindow.width / 2) - (healButton.width/2);
		healButton.label = new FlxText(0,0,160,"Defend/Heal");
		healButton.label.setFormat(null, 22, 0xffffff, "center");
		add(healButton);
		
		Reg.pointerSp = new FlxSprite(attackButton.x+attackButton.width-32,attackButton.y+attackButton.height/2,Reg.pointerImg);
		add(Reg.pointerSp);
		battleStep = 0;
		actionSelect = 0;
		enemySelect = 0;
		defending = false;
		_turnTimer = 1.5;
		turn = 0;
	}
	
	public function attackRound():Void
	{
		Reg.pointerSp.visible = false;
		actionSelect = 0;
		Reg.pointerSp.x = attackButton.x+attackButton.width-32;
		Reg.pointerSp.y = attackButton.y+attackButton.height/2;
		battleActions = new Array();
		eturn = 0;
		turnCount = enemies.length+1;
		if(Reg.playerToken == 4 || Reg.playerToken == 5)
		{
			if(defending)
			{
				battleActions.push("player_heal");
			}
			else
			{
				battleActions.push("player_attack");
			}
			for(i in 0 ... enemies.length)
			{
				battleActions.push("enemy_attack");
			}
		}
		else
		{
			var playerPos = Std.random(enemies.length+1);
			for(i in 0 ... enemies.length+1)
			{
				if(i == playerPos)
				{
					if(defending)
					{
						battleActions.push("player_heal");
					}
					else
					{
						battleActions.push("player_attack");
					}
				}
				else
				{
					battleActions.push("enemy_attack");
				}
			}
		}
	}
	
	override public function update():Void
	{
		super.update();  
		if (enemies.length == 0)
		{
			attacktext.visible = false;
			attacktext = new FlxText(enemyWindow.x+20,enemyWindow.y+20,enemyWindow.width-40,"Congratualtions! You Won!");
			attacktext.size = 30;
			attacktext.alignment = "center";
			add(attacktext);
			Events.battleOpen = false;
			battleStep = 3;
			Reg.pointerSp.visible = false;
		}
		if (battleStep == 0)
		{
			for(mon in 0...enemies.length)
			{
				if(enemies[mon].health <= 0)
				{
					enemies[mon].kill();
					if (mon == enemies.length-1)
					{
						enemies.pop();// = enemies.slice(0, mon);
						break;
					}
					else
					{
						enemies.remove(enemies[mon]);
						break;
					}
				}
			}
			enemySelect = 0;
			if(Reg.pointerSp.visible == false)
			{
				Reg.pointerSp.visible = true;
			}
			_turnTimer = 1.5;
			if (FlxG.keys.justPressed.DOWN)
			{
				if(actionSelect == 0)
				{
					actionSelect = 1;
					Reg.pointerSp.x = healButton.x+healButton.width-32;
					Reg.pointerSp.y = healButton.y+healButton.height/2;
				}
				else if (actionSelect == 1)
				{
					actionSelect = 0;
					Reg.pointerSp.x = attackButton.x+attackButton.width-32;
					Reg.pointerSp.y = attackButton.y+attackButton.height/2;
				}
			}
			else if (FlxG.keys.justPressed.UP)
			{
				if(actionSelect == 0)
				{
					actionSelect = 1;
					Reg.pointerSp.x = healButton.x+healButton.width-32;
					Reg.pointerSp.y = healButton.y+healButton.height/2;
				}
				else if (actionSelect == 1)
				{
					actionSelect = 0;
					Reg.pointerSp.x = attackButton.x+attackButton.width-32;
					Reg.pointerSp.y = attackButton.y+attackButton.height/2;
				}
			}
			else if (FlxG.keys.justPressed.SPACE)
			{
				if (enemies.length > 0)
				{
					if(actionSelect == 0)
					{
						//swithc to monster select
						Reg.pointerSp.x = enemies[0].x+enemies[0].width/2;
						Reg.pointerSp.y = enemies[0].y+enemies[0].height/2;
						battleStep = 1;
						defending = false;
					}
					else if (actionSelect == 1)
					{
						//heal self
						//start battle round
						battleStep = 2;
						turn = 0;
						defending = true;
						attackRound();
					}
				}
			}
		}
		else if (battleStep == 1)
		{
			if (FlxG.keys.justPressed.LEFT)
			{
				selectNextEnemy("left");
			}
			else if (FlxG.keys.justPressed.RIGHT)
			{
				selectNextEnemy("right");
			}
			else if (FlxG.keys.justPressed.SPACE)
			{
				//choose Monster
				//start battle round
				battleStep = 2;
				turn = 0;
				attackRound();
			}
		}
		else if (battleStep == 2)
		{
			_turnTimer -= FlxG.elapsed;
			if (_turnTimer < 0)
			{
				//do action
				_turnTimer = 1.5;
				switch(battleActions[turn])
				{
					case "player_heal":
						attacktext = new FlxText(enemyWindow.x+20,enemyWindow.y+20,enemyWindow.width-40,"Hero Defends!");
						attacktext.size = 20;
						attacktext.alignment = "center";
						add(attacktext);
						haxe.Timer.delay(endText, 500);
						if(Reg.playerToken == 2 || Reg.playerToken == 3)
						{
							playerHealth += cast(Reg.playerHeal/2,Int);
						}
						playerHealth += Reg.playerHeal;
						if(playerHealth > Reg.playerMaxHealth)
						{
							playerHealth = Reg.playerMaxHealth;
						}
						Reg.text.text = "HP: "+playerHealth+"/"+Reg.playerMaxHealth;
						turn++;
					case "player_attack":
						var critical = Std.random(4);
						if (critical == 0)
						{
							if(Reg.playerToken == 6 || Reg.playerToken == 7)
							{
								enemies[enemySelect].health -= (Reg.playerAttack+Reg.playerAttack/2)*2;
							}
							else
							{
								enemies[enemySelect].health -= Reg.playerAttack*2;
							}
						}
						else
						{
							if(Reg.playerToken == 6 || Reg.playerToken == 7)
							{
								enemies[enemySelect].health -= Reg.playerAttack+Reg.playerAttack/2;
							}
							else
							{
								enemies[enemySelect].health -= Reg.playerAttack;
							}
						}
						attacktext = new FlxText(enemyWindow.x+20,enemyWindow.y+20,enemyWindow.width-40,"Hero Attacks!");
						attacktext.size = 20;
						if (critical == 0)
						{
							attacktext.text = "Heroic Blow!";
						}
						attacktext.alignment = "center";
						add(attacktext);
						haxe.Timer.delay(endText, 500);
						ex = cast(enemies[enemySelect].x,Int);
						ey = cast(enemies[enemySelect].y,Int);
						
						Reg.powSprite = new FlxSprite(ex,ey,Reg.powImg);
						add(Reg.powSprite);
						haxe.Timer.delay(endPow, 500);
						turn++;
					case "enemy_attack":
						if(enemies[eturn].health > 0)
						{
							var nothing = Std.random(4);
							attacktext = new FlxText(enemyWindow.x+20,enemyWindow.y+20,enemyWindow.width-40,enemies[eturn].name+" Attacks!");
							attacktext.size = 20;
							if (nothing == 0)
							{
								attacktext.text = enemies[eturn].name+" Misses!";
							}
							attacktext.alignment = "center";
							add(attacktext);
							haxe.Timer.delay(endText, 500);
							if (nothing != 0)
							{
								if(Reg.playerToken == 0 || Reg.playerToken == 1)
								{
									if(defending)
									{
										playerHealth -= cast(enemies[eturn].attack/2,Int);
									}
									else
									{
										playerHealth -= cast(enemies[eturn].attack/2,Int);
									}
								}
								else
								{
									if(defending)
									{
										playerHealth -= cast(enemies[eturn].attack/2,Int);
									}
									else
									{
										playerHealth -= enemies[eturn].attack;
									}
								}
								if (playerHealth < 0)
								{
									playerHealth = 0;
								}
								Reg.text.text = "HP: "+playerHealth+"/"+Reg.playerMaxHealth;
								Reg.powSprite = new FlxSprite(character.x,character.y,Reg.powImg);
								add(Reg.powSprite);
								haxe.Timer.delay(endPow, 500);
							}
						}
						eturn++;
						turn++;
				}
			}
			if(turn >= turnCount)
			{
				battleStep = 0;
			}
		}
	}
	
	private function finishBattle():Void
	{
		visible = false;
		//Events.eventOpen = false;
	}
	
	private function endText():Void
	{
		attacktext.visible = false;
	}
	
	private function endPow():Void
	{
		Reg.powSprite.kill();
		if (enemies.length > 0)
		{
			if(enemies[enemySelect].health <= 0)
			{
				enemies[enemySelect].visible = false;
			}
		}
		if (playerHealth == 0)
		{
			goToLose();
		}
	}
	
	private function goToLose():Void
	{
		FlxG.switchState(new LoseState());
	}
	
	public function selectNextEnemy(dir:String)
	{
		if (dir == "left")
		{
			enemySelect--;
			if(enemySelect < 0)
			{
				enemySelect = enemies.length-1;
			}
			Reg.pointerSp.x = enemies[enemySelect].x+enemies[enemySelect].width/2;
			Reg.pointerSp.y = enemies[enemySelect].y+enemies[enemySelect].height/2;
		}
		else
		{
			enemySelect++;
			if(enemySelect > enemies.length-1)
			{
				enemySelect = 0;
			}
			Reg.pointerSp.x = enemies[enemySelect].x+enemies[enemySelect].width/2;
			Reg.pointerSp.y = enemies[enemySelect].y+enemies[enemySelect].height/2;
		}
	}
}
