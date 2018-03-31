package;


import openfl.Assets;
import flash.geom.Rectangle;
import flash.net.SharedObject;
import flash.filters.GlowFilter;

import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.util.FlxPath;
import flixel.util.FlxSave;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxPoint;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.tile.FlxTilemap;
import flixel.effects.FlxSpriteFilter;

import flixel.addons.display.FlxExtendedSprite;

class PlayerSelectState extends FlxState
{
	public var playerSpt:FlxSprite;
	
	public var playerSelect:Int;
	
	public var inputSelect:Int;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.mouse.visible = false;
		
		Reg.text = new FlxText(10,10,502,"To begin your quest, you must first select your champion. Each champion has its own ability to aid you to victory.");
		Reg.text.size = 28;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		Reg.leftBtn = new FlxButton((FlxG.width/2)-64, 176, "", moveTokenLeft);
		Reg.leftBtn.loadGraphic(Reg.btnLeftImg);
		add(Reg.leftBtn);
		
		Reg.playerToken = -1;
		playerSelect = 0;
		playerSpt = new FlxSprite((FlxG.width/2)-32,160,Reg.battleSprites[0]);
		add(playerSpt);
		
		Reg.rightBtn = new FlxButton((FlxG.width/2)+32, 176, "", moveTokenRight);
		Reg.rightBtn.loadGraphic(Reg.btnRightImg);
		add(Reg.rightBtn);
		
		Reg.tokenDesc = new FlxText(0,220,512,"Paladins have strong defense. This means they take less damage.");
		Reg.tokenDesc.size = 16;
		Reg.tokenDesc.alignment = "center";
		add(Reg.tokenDesc); 
		
		Reg.selectbutton = new FlxButton((FlxG.width/2) - 80, 260, "Select Hero", selectPlayer);
		Reg.selectbutton.loadGraphic(Reg.buttonImg,false,160,40);
		Reg.selectbutton.label = new FlxText(0,0,160,"Select Hero");
		Reg.selectbutton.label.setFormat(null, 22, 0xffffff, "center");
		add(Reg.selectbutton);
		
		/*Reg.beginbutton = new FlxButton((FlxG.width/2) - 80, 330, "Begin", goToGame);
		Reg.beginbutton.loadGraphic(Reg.buttonImg,false,160,40);
		Reg.beginbutton.label = new FlxText(0,0,160,"Begin");
		Reg.beginbutton.label.setFormat(null, 22, 0xffffff, "center");
		add(Reg.beginbutton);*/
		
		Reg.pointerSp = new FlxSprite(Reg.leftBtn.x+Reg.leftBtn.width/2,Reg.leftBtn.y+Reg.leftBtn.height/2,Reg.pointerImg);
		add(Reg.pointerSp);
		inputSelect = 0;
		
		Reg.text = new FlxText(10,380,502,"Instructions:");
		Reg.text.size = 30;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		Reg.text = new FlxText(10,420,502,"Use the arrow keys to move around the map. Press Space while standing on a node to enter it. Blue nodes are friendly, red nodes are enemies. Use the space bar to select actions and monsters in battle. Help the people of this kingdom rid themselves of the evil that plagues them.");
		Reg.text.size = 14;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		super.create();
	}
	
	private function moveTokenLeft():Void
	{
		switchToken(1);
	}
	
	private function moveTokenRight():Void
	{
		switchToken(2);
	}
	
	private function switchToken(dir:Int):Void
	{
		if(Reg.playerToken == -1)
		{
			if(dir == 1)
			{
				playerSelect = playerSelect - 1;
				if (playerSelect < 0)
				{
					playerSelect = 7;
				}
			}
			if(dir == 2)	
			{
				playerSelect = playerSelect + 1;
				if (playerSelect > 7)
				{
					playerSelect = 0;
				}
			}
			playerSpt.loadGraphic(Reg.battleSprites[playerSelect]);
			switch(playerSelect)
			{
				case 0:
					Reg.tokenDesc.text = "Paladins have strong defense. This means they take less damage.";
				case 1:
					Reg.tokenDesc.text = "Paladins have strong defense. This means they take less damage.";
				case 2:
					Reg.tokenDesc.text = "Priests are always prepared to heal. Heal extra HP when choosing that option in battle.";
				case 3:
					Reg.tokenDesc.text = "Priests are always prepared to heal. Heal extra HP when choosing that option in battle.";
				case 4:
					Reg.tokenDesc.text = "Thieves are masters of speed. They always attack first.";
				case 5:
					Reg.tokenDesc.text = "Thieves are masters of speed. They always attack first.";
				case 6:
					Reg.tokenDesc.text = "Wizards have strong magic. This means they cause more damage when attacking.";
				case 7:
					Reg.tokenDesc.text = "Wizards have strong magic. This means they cause more damage when attacking.";
			}
		}
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		if(Reg.playerToken == -1)
		{
			if (FlxG.keys.justPressed.DOWN)
			{
				if(inputSelect == 1 || inputSelect == 0)
				{
					inputSelect = 2;
					Reg.pointerSp.x = Reg.selectbutton.x+Reg.selectbutton.width-32;
					Reg.pointerSp.y = Reg.selectbutton.y+Reg.selectbutton.height/2;
				}
				/*else if (inputSelect == 2)
				{
					inputSelect = 3;
					Reg.pointerSp.x = Reg.beginbutton.x+Reg.beginbutton.width-32;
					Reg.pointerSp.y = Reg.beginbutton.y+Reg.beginbutton.height/2;
				}*/
				else if (inputSelect == 2)
				{
					inputSelect = 0;
					Reg.pointerSp.x = Reg.leftBtn.x+Reg.leftBtn.width/2;
					Reg.pointerSp.y = Reg.leftBtn.y+Reg.leftBtn.height/2;
				}
			}
			else if (FlxG.keys.justPressed.UP)
			{
				if(inputSelect == 1 || inputSelect == 0)
				{
					inputSelect = 2;
					Reg.pointerSp.x = Reg.selectbutton.x+Reg.selectbutton.width-32;
					Reg.pointerSp.y = Reg.selectbutton.y+Reg.selectbutton.height/2;
					/*inputSelect = 3;
					Reg.pointerSp.x = Reg.beginbutton.x+Reg.beginbutton.width-32;
					Reg.pointerSp.y = Reg.beginbutton.y+Reg.beginbutton.height/2;*/
				}
				else if (inputSelect == 2)
				{
					inputSelect = 0;
					Reg.pointerSp.x = Reg.leftBtn.x+Reg.leftBtn.width/2;
					Reg.pointerSp.y = Reg.leftBtn.y+Reg.leftBtn.height/2;
				}
				/*else if (inputSelect == 3)
				{
					inputSelect = 2;
					Reg.pointerSp.x = Reg.selectbutton.x+Reg.selectbutton.width-32;
					Reg.pointerSp.y = Reg.selectbutton.y+Reg.selectbutton.height/2;
				}*/
			}
			else if (FlxG.keys.justPressed.LEFT)
			{
				if (inputSelect == 0)
				{
					inputSelect = 1;
					Reg.pointerSp.x = Reg.rightBtn.x+Reg.rightBtn.width/2;
					Reg.pointerSp.y = Reg.rightBtn.y+Reg.rightBtn.height/2;
				}
				else if (inputSelect == 1)
				{
					inputSelect = 0;
					Reg.pointerSp.x = Reg.leftBtn.x+Reg.leftBtn.width/2;
					Reg.pointerSp.y = Reg.leftBtn.y+Reg.leftBtn.height/2;
				}
			}
			else if (FlxG.keys.justPressed.RIGHT)
			{
				if (inputSelect == 0)
				{
					inputSelect = 1;
					Reg.pointerSp.x = Reg.rightBtn.x+Reg.rightBtn.width/2;
					Reg.pointerSp.y = Reg.rightBtn.y+Reg.rightBtn.height/2;
				}
				else if (inputSelect == 1)
				{
					inputSelect = 0;
					Reg.pointerSp.x = Reg.leftBtn.x+Reg.leftBtn.width/2;
					Reg.pointerSp.y = Reg.leftBtn.y+Reg.leftBtn.height/2;
				}
			}
			if (FlxG.keys.justPressed.SPACE)
			{
				switch(inputSelect)
				{
					case 0:
						this.moveTokenLeft();
					case 1:
						this.moveTokenRight();
					case 2:
						this.selectPlayer();
						inputSelect = 3;
						//Reg.pointerSp.x = Reg.beginbutton.x+Reg.beginbutton.width-32;
						//Reg.pointerSp.y = Reg.beginbutton.y+Reg.beginbutton.width/2;
						this.goToGame();
					case 3:
						//this.goToGame();
				}
			}
		}
		if (Reg.playerToken != -1 && FlxG.keys.justPressed.SPACE)
		{
			this.goToGame();
		}
		
		super.update();
	}	
	
	private function selectPlayer():Void
	{
		Reg.pFilter = new FlxSpriteFilter(playerSpt);
		Reg.pFilter.removeAllFilters();
		Reg.pFilter.addFilter(new GlowFilter(0xff0000, 1, 10, 10, 2, 1));
		
		Reg.playerToken = playerSelect;
	}
	
	private function goToGame():Void
	{
		FlxG.switchState(new PlayState());
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}
}
