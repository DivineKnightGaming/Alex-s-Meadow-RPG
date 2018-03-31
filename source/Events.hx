package;

import flixel.FlxG;
import flixel.util.FlxSave;
import flixel.tile.FlxTilemap;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.effects.FlxSpriteFilter;
import flixel.group.FlxGroup;


/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Events
{
	public static var eventOpen:Bool = false;
	public static var battleOpen:Bool = false;
	public static var castleState:Int = 1;
	public static var houseState:Int = 1;
	public static var mountState:Int = 0;
	public static var forestState:Int = 0;
	public static var caveState:Int = 0;
	public static var towerState:Int = 0;
	
	public static var houseText:Array<Dynamic> = [null, "Hunter: Hey. If you want to be let into the castle, help me out. I lost my bow on the mountain path. If you get it for me, I will loan you a castle entrance pass.",
												"Hunter: Thank you for bringing my bow. Here is the pass I promised.",
												"Hunter: Thanks again. Good luck with the King. I know he was really needing the help."];
	public static var castleText:Array<Dynamic> = [null, "Guard: Sorry. With the increase in monsters, only those with a pass can gain entrance to the castle.",
												"King: Sorry for the inconvenice with the gate, but we have a severe monster problem. If you want to help, you will have to pass a test. Clear the goblins from the forest and I will tell you more."
												,"King: Thank you for clearing the woods. As for our real needs, The Witch in the tower across the river is threatening our people. Please take care of her. You will be rewarded handsomly.",
												"King: Please return once you have defeated the evil Witch.",
												"King: Thank you for your bravery in defeating the evil Witch. While we are eternally in your debt, please accept this humble reward."];
	public static var mountText:Array<Dynamic> = ["Not sure what is hiding here. Probably want to avoid it for now.", 
												"Looks pretty dangerous. But I really need to find that bow.", [[0, "Snake", 12, 2], [0, "Snake", 12, 2], [0, "Snake", 12, 2], [1, "Slime", 9, 2], [1, "Slime", 9, 2]], 
												"Is that bow anywhere around here? There are a lot of monsters here.", [[2, "Whelp", 18, 4], [0, "Snake", 12, 2], [2, "Whelp", 18, 4], [1, "Slime", 9, 2], [1, "Slime", 9, 2]], 
												"There is the bow! Should be easy sailing from here on out.", [[2, "Whelp", 18, 4], [3, "Dragon", 24, 6], [2, "Whelp", 18, 4]],
												"Glad that is over. Time to get the bow back to the hunter.","I am done with this mountain. There is no reason to go back."];
	public static var forestText:Array<Dynamic> = ["Looks really creepy. Probably want to avoid it for now.",
												"Time to get busy clearing out this forest. Wonder what I will run into here.", [[4, "Spider", 12, 2], [4, "Spider", 12, 2], [4, "Spider", 12, 2], [5, "Goblin", 18, 2], [5, "Goblin", 18, 2]], 
												"Seems to be more monsters than I thought there would be.", [[5, "Goblin", 18, 2], [5, "Goblin", 18, 2], [5, "Goblin", 18, 2], [6, "Goblin Knight", 24, 4], [6, "Goblin Knight", 24, 4]], 
												"Looks like I have found the leader. Taking him out should drive the rest away.", [[6, "Goblin Knight", 24, 4], [7, "Royal Goblin", 36, 6], [6, "Goblin Knight", 24, 4]],
												"That's all of them. Time to go tell the King.", "The place is clear. No reason to get lost here now."];
	public static var caveText:Array<Dynamic> = ["This place is crawling with ogres. Probably want to avoid it right now.",
												"I hope I can find a useful disguise in here somewhere.", [[8, "Bat", 18, 2], [8, "Bat", 18, 2], [8, "Bat", 18, 2], [9, "Ogre", 24, 4], [9, "Ogre", 24, 4]], 
												"Still nothing useful around here. Gotta delve deeper.", [[9, "Ogre", 24, 4], [9, "Ogre", 24, 4], [9, "Ogre", 24, 4], [10, "Ogre Mage", 30, 4], [10, "Ogre Mage", 30, 4]], 
												"The armor on that Ogre Warrior should do nicely.", [[10, "Ogre Mage", 30, 4], [11, "Ogre Knight", 42, 6], [10, "Ogre Mage", 30, 4]],
												"Not only do i look like an ogre, I smell like one too. Time to invade the tower.", "I think I will be avoiding this place from here on out."];
	public static var towerText:Array<Dynamic> = ["Looks to be heavily guarded. Probably want to avoid it for now.", 
												"I don't think a direct approach is feasable here. Perhaps a disguise will get me in. I saw a cave with some ogres somewhere around here. Perhaps something of their's will work.",
												"The diguise worked! I am in now.", 
												"Crap! I have been made. Nothing to do now but fight my way through.", [[12, "Skeleton", 18, 2], [12, "Skeleton", 18, 2], [12, "Skeleton", 18, 2], [13, "Skeleton Mage", 24, 4], [13, "Skeleton Mage", 24, 4]], 
												"Where did all these skeletons come from?", [[13, "Skeleton Mage", 24, 4], [14, "Skeleton Knight", 24, 4], [13, "Skeleton Mage", 24, 4], [14, "Skeleton Knight", 24, 4], [14, "Skeleton Knight", 24, 4]], 
												"Evil Witch: You will never stop me. I have grown far too powerful for the likes of you.", [[14, "Skeleton Knight", 24, 4], [15, "Evil Witch", 48, 8], [14, "Skeleton Knight", 24, 4], [13, "Skeleton Mage", 24, 4], [13, "Skeleton Mage", 24, 4]],
												"Evil Witch: Impossible! How could my power be overcome by you?", "I have won. I didn't think I would make it. Time to tell the King and claim my reward.", "The Witch is dead. No reason to hang around here any more."];
	
	public static var enemies:FlxGroup;
	public static var enemy1:FlxSprite;
	public static var enemy2:FlxSprite;
	public static var enemy3:FlxSprite;
	public static var enemy4:FlxSprite;
	public static var enemy5:FlxSprite;
	
	public static var speechWindow:SpeechWindow;
	public static var battleWindow:BattleWindow;
	
	public static var eventWindow:FlxSprite;
	public static var enemyWindow:FlxSprite;
	public static var playerWindow:FlxSprite;
	public static var characterWindow:FlxSprite;
	public static var character:FlxSprite;
	
	public static function loadEvent(state:PlayState, name:String):Void
	{
		switch (name)
		{
			case "house":
				loadHouseEvent(state);
			case "castle":
				loadCastleEvent(state);
			case "mount":
				loadMountEvent(state);
			case "forest":
				loadForestEvent(state);
			case "cave":
				loadCaveEvent(state);
			case "tower":
				loadTowerEvent(state);
		}
		eventOpen = true;
		
		//trace("event open2: "+eventOpen);
	}
	
	public static function closeEvent(state:PlayState, name:String):Void
	{
		//close out stuff
		switch (name)
		{
			case "house":
				closeHouseEvent(state);
			case "castle":
				closeCastleEvent(state);
			case "mount":
				closeMountEvent(state);
			case "forest":
				closeForestEvent(state);
			case "cave":
				closeCaveEvent(state);
			case "tower":
				closeTowerEvent(state);
		}
	}
	
	public static function loadHouseEvent(state:PlayState):Void
	{
		//trace("event open1: "+eventOpen);
		switch (houseState)
		{
			case 0:
				//nothing
			case 1:
				//load first houseText
				speechWindow = new SpeechWindow(houseText[1],Reg.hunter);
				state.add(speechWindow);
				if (mountState < 1)
				{
					mountState = 1;
				}
			case 2:
				//load second houseText
				speechWindow = new SpeechWindow(houseText[2],Reg.hunter);
				state.add(speechWindow);
			case 3:
				//load second houseText
				speechWindow = new SpeechWindow(houseText[3],Reg.hunter);
				state.add(speechWindow);
		}
	}
	
	public static function closeHouseEvent(state:PlayState):Void 
	{
		speechWindow.visible = false;
		eventOpen = false;
		if (houseState == 2)
		{
			houseState = 3;
			castleState = 2;
		}
	}
	
	public static function loadCastleEvent(state:PlayState):Void
	{
		switch (castleState)
		{
			case 0:
				//nothing
			case 1:
				speechWindow = new SpeechWindow(castleText[1],Reg.guard);
				state.add(speechWindow);
			case 2:
				speechWindow = new SpeechWindow(castleText[2],Reg.king);
				state.add(speechWindow);
			case 3:
				speechWindow = new SpeechWindow(castleText[3],Reg.king);
				state.add(speechWindow);
			case 4:
				speechWindow = new SpeechWindow(castleText[4],Reg.king);
				state.add(speechWindow);
			case 5:
				speechWindow = new SpeechWindow(castleText[5],Reg.king);
				state.add(speechWindow);
		}
	}
	
	public static function closeCastleEvent(state:PlayState):Void 
	{
		speechWindow.visible = false;
		eventOpen = false;
		if (castleState == 2)
		{
			forestState = 1;
		}
		else if (castleState == 3)
		{
			towerState = 1;
			castleState = 4;
		}
		else if (castleState == 5)
		{
			goToWin();
		}
	}
	
	public static function goToWin():Void
	{
		FlxG.switchState(new WinState());
	}
	
	public static function loadMountEvent(state:PlayState):Void
	{
		switch (mountState)
		{
			case 0:
				speechWindow = new SpeechWindow(mountText[0],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 1:
				speechWindow = new SpeechWindow(mountText[1],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 2:
				battleOpen = true;
				battleWindow = new BattleWindow(mountText[2],Reg.battleSprites[Reg.playerToken]);
				state.add(battleWindow);
			case 3:
				speechWindow = new SpeechWindow(mountText[3],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 4:
				battleOpen = true;
				battleWindow = new BattleWindow(mountText[4],Reg.battleSprites[Reg.playerToken]);
				state.add(battleWindow);
			case 5:
				speechWindow = new SpeechWindow(mountText[5],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 6:
				battleOpen = true;
				battleWindow = new BattleWindow(mountText[6],Reg.battleSprites[Reg.playerToken]);
				state.add(battleWindow);
			case 7:
				speechWindow = new SpeechWindow(mountText[7],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 8:
				speechWindow = new SpeechWindow(mountText[8],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
				
		}
	}
	
	public static function closeMountEvent(state:PlayState):Void 
	{
		if (mountState == 0 || mountState == 1)
		{
			speechWindow.visible = false;
			if (mountState == 1)
			{
				mountState = 2;
				loadMountEvent(state);
			}
			else
			{
				eventOpen = false;
			}
		}
		else if (mountState == 2)
		{
			battleWindow.destroy();
			battleWindow = null;
			mountState = 3;
			loadMountEvent(state);
		}
		else if (mountState == 3)
		{
			speechWindow.visible = false;
			mountState = 4;
			loadMountEvent(state);
		}
		else if (mountState == 4)
		{
			battleWindow.destroy();
			battleWindow = null;
			mountState = 5;
			loadMountEvent(state);
		}
		else if (mountState == 5)
		{
			speechWindow.visible = false;
			mountState = 6;
			loadMountEvent(state);
		}
		else if (mountState == 6)
		{
			battleWindow.destroy();
			battleWindow = null;
			mountState = 7;
			loadMountEvent(state);
		}
		else if (mountState == 7)
		{
			speechWindow.visible = false;
			mountState = 8;
			houseState = 2;
			eventOpen = false;
		}
		else
		{
			speechWindow.visible = false;
			eventOpen = false;
		}
	}
	
	public static function loadForestEvent(state:PlayState):Void
	{
		switch (forestState)
		{
			case 0:
				speechWindow = new SpeechWindow(forestText[0],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 1:
				speechWindow = new SpeechWindow(forestText[1],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 2:
				battleOpen = true;
				battleWindow = new BattleWindow(forestText[2],Reg.battleSprites[Reg.playerToken]);
				state.add(battleWindow);
			case 3:
				speechWindow = new SpeechWindow(forestText[3],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 4:
				battleOpen = true;
				battleWindow = new BattleWindow(forestText[4],Reg.battleSprites[Reg.playerToken]);
				state.add(battleWindow);
			case 5:
				speechWindow = new SpeechWindow(forestText[5],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 6:
				battleOpen = true;
				battleWindow = new BattleWindow(forestText[6],Reg.battleSprites[Reg.playerToken]);
				state.add(battleWindow);
			case 7:
				speechWindow = new SpeechWindow(forestText[7],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 8:
				speechWindow = new SpeechWindow(forestText[8],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
				
		}
	}
	
	public static function closeForestEvent(state:PlayState):Void 
	{
		if (forestState == 0 || forestState == 1)
		{
			speechWindow.visible = false;
			if (forestState == 1)
			{
				forestState = 2;
				loadForestEvent(state);
			}
			else
			{
				eventOpen = false;
			}
		}
		else if (forestState == 2)
		{
			battleWindow.destroy();
			battleWindow = null;
			forestState = 3;
			loadForestEvent(state);
		}
		else if (forestState == 3)
		{
			speechWindow.visible = false;
			forestState = 4;
			loadForestEvent(state);
		}
		else if (forestState == 4)
		{
			battleWindow.destroy();
			battleWindow = null;
			forestState = 5;
			loadForestEvent(state);
		}
		else if (forestState == 5)
		{
			speechWindow.visible = false;
			forestState = 6;
			loadForestEvent(state);
		}
		else if (forestState == 6)
		{
			battleWindow.destroy();
			battleWindow = null;
			forestState = 7;
			loadForestEvent(state);
		}
		else if (forestState == 7)
		{
			speechWindow.visible = false;
			forestState = 8;
			castleState = 3;
			eventOpen = false;
		}
		else
		{
			speechWindow.visible = false;
			eventOpen = false;
		}
	}
	
	public static function loadCaveEvent(state:PlayState):Void
	{
		switch (caveState)
		{
			case 0:
				speechWindow = new SpeechWindow(caveText[0],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 1:
				speechWindow = new SpeechWindow(caveText[1],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 2:
				battleOpen = true;
				battleWindow = new BattleWindow(caveText[2],Reg.battleSprites[Reg.playerToken]);
				state.add(battleWindow);
			case 3:
				speechWindow = new SpeechWindow(caveText[3],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 4:
				battleOpen = true;
				battleWindow = new BattleWindow(caveText[4],Reg.battleSprites[Reg.playerToken]);
				state.add(battleWindow);
			case 5:
				speechWindow = new SpeechWindow(caveText[5],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 6:
				battleOpen = true;
				battleWindow = new BattleWindow(caveText[6],Reg.battleSprites[Reg.playerToken]);
				state.add(battleWindow);
			case 7:
				speechWindow = new SpeechWindow(caveText[7],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 8:
				speechWindow = new SpeechWindow(caveText[8],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
				
		}
	}
	
	public static function closeCaveEvent(state:PlayState):Void 
	{
		if (caveState == 0 || caveState == 1)
		{
			speechWindow.visible = false;
			if (caveState == 1)
			{
				caveState = 2;
				loadCaveEvent(state);
			}
			else
			{
				eventOpen = false;
			}
		}
		else if (caveState == 2)
		{
			battleWindow.destroy();
			battleWindow = null;
			caveState = 3;
			loadCaveEvent(state);
		}
		else if (caveState == 3)
		{
			speechWindow.visible = false;
			caveState = 4;
			loadCaveEvent(state);
		}
		else if (caveState == 4)
		{
			battleWindow.destroy();
			battleWindow = null;
			caveState = 5;
			loadCaveEvent(state);
		}
		else if (caveState == 5)
		{
			speechWindow.visible = false;
			caveState = 6;
			loadCaveEvent(state);
		}
		else if (caveState == 6)
		{
			battleWindow.destroy();
			battleWindow = null;
			caveState = 7;
			loadCaveEvent(state);
		}
		else if (caveState == 7)
		{
			speechWindow.visible = false;
			caveState = 8;
			towerState = 2;
			eventOpen = false;
		}
		else
		{
			speechWindow.visible = false;
			eventOpen = false;
		}
	}
	
	public static function loadTowerEvent(state:PlayState):Void
	{
		switch (towerState)
		{
			case 0:
				speechWindow = new SpeechWindow(towerText[0],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 1:
				speechWindow = new SpeechWindow(towerText[1],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 2:
				speechWindow = new SpeechWindow(towerText[2],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 3:
				speechWindow = new SpeechWindow(towerText[3],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 4:
				battleOpen = true;
				battleWindow = new BattleWindow(towerText[4],Reg.battleSprites[Reg.playerToken]);
				state.add(battleWindow);
			case 5:
				speechWindow = new SpeechWindow(towerText[5],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 6:
				battleOpen = true;
				battleWindow = new BattleWindow(towerText[6],Reg.battleSprites[Reg.playerToken]);
				state.add(battleWindow);
			case 7:
				speechWindow = new SpeechWindow(towerText[7],Reg.monsterSprites[15]);
				state.add(speechWindow);
			case 8:
				battleOpen = true;
				battleWindow = new BattleWindow(towerText[8],Reg.battleSprites[Reg.playerToken]);
				state.add(battleWindow);
			case 9:
				speechWindow = new SpeechWindow(towerText[9],Reg.monsterSprites[15]);
				state.add(speechWindow);
			case 10:
				speechWindow = new SpeechWindow(towerText[10],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
			case 11:
				speechWindow = new SpeechWindow(towerText[11],Reg.battleSprites[Reg.playerToken]);
				state.add(speechWindow);
				
		}
	}
	
	public static function closeTowerEvent(state:PlayState):Void 
	{
		if (towerState == 0 || towerState == 1 || towerState == 2)
		{
			speechWindow.visible = false;
			if (towerState == 1)
			{
				caveState = 1;
				eventOpen = false;
				//loadTowerEvent(state);
			}
			else if (towerState == 2)
			{
				towerState = 3;
				loadTowerEvent(state);
			}
			else
			{
				eventOpen = false;
			}
		}
		else if (towerState == 3)
		{
			speechWindow.visible = false;
			towerState = 4;
			loadTowerEvent(state);
		}
		else if (towerState == 4)
		{
			battleWindow.destroy();
			battleWindow = null;
			towerState = 5;
			loadTowerEvent(state);
		}
		else if (towerState == 5)
		{
			speechWindow.visible = false;
			towerState = 6;
			loadTowerEvent(state);
		}
		else if (towerState == 6)
		{
			battleWindow.destroy();
			battleWindow = null;
			towerState = 7;
			loadTowerEvent(state);
		}
		else if (towerState == 7)
		{
			speechWindow.visible = false;
			towerState = 8;
			loadTowerEvent(state);
		}
		else if (towerState == 8)
		{
			battleWindow.destroy();
			battleWindow = null;
			towerState = 9;
			loadTowerEvent(state);
		}
		else if (towerState == 9)
		{
			speechWindow.visible = false;
			towerState = 10;
			loadTowerEvent(state);
		}
		else if (towerState == 10)
		{
			speechWindow.visible = false;
			towerState = 11;
			castleState = 5;
			eventOpen = false;
		}
		else
		{
			speechWindow.visible = false;
			eventOpen = false;
		}
	}
}
