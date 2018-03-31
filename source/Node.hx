package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.group.FlxGroup;

/**
 * ...
 * @author .:BuzzJeux:.
 */

class Node extends FlxSprite
{
	public var type:String;
	public var _x:Int;
	public var _y:Int;
	public var name:String;
	public var shown:String;
	public var open:String;
	
	public var button:FlxButton;
	
	public var showingButton:Bool;
	///public var eventOpen:Bool;
	
	public function new(X:Int, Y:Int, _type:String, _name:String, state:PlayState, _shown:String, _open:String)
	{
		// X,Y: Starting coordinates
		super(X+8, Y);
		type = _type;
		_x = X;
		_y = Y;
		name = _name;
		shown = _shown;
		open = _open;
		
		showingButton = false;
		//eventOpen = false;
		
		if (type == "good_node")
		{
			loadGraphic(Reg.nodeGoodImg);
			button = new FlxButton(_x-24, _y-30, "Enter");
			button.loadGraphic(Reg.goodbuttonImg,false,80,20);
			button.label.setFormat(null, 16, 0xffffff, "center");
			//Reg.goodbutton.labelOffsets = [FlxPoint.get(-.5, -.5), FlxPoint.get(-.5, -.5), FlxPoint.get(-0.5, -.5)];
			state.add(button);
		}
		else
		{
			loadGraphic(Reg.nodeBadImg);
			button = new FlxButton(_x-24, _y-30, "Enter");
			button.loadGraphic(Reg.badbuttonImg,false,80,20);
			button.label.setFormat(null, 16, 0xffffff, "center");
			//Reg.goodbutton.labelOffsets = [FlxPoint.get(-.5, -.5), FlxPoint.get(-.5, -.5), FlxPoint.get(-0.5, -.5)];
			state.add(button);
		}
		button.visible = false;
	}
	
	override public function update():Void
	{
		super.update();  
		
		
	}
	
	public function checkCollision(player:Player, state:PlayState):Void
	{
		if ((player.x >= _x && player.x < _x+32) && (player.y >= _y && player.y < _y+32))
		{
			button.visible = true;
			showingButton = true;
		}
		else 
		{
			button.visible = false;
			showingButton = false;
			//if (eventOpen)
			/*if (Events.eventOpen)
			{
				Events.closeEvent(state, name);
				//Events.eventOpen = false;
				//eventOpen = false;
			}*/
		}
	}
	
	public function checkForEvent(state:PlayState):Void
	{
		if (showingButton)
		{
			//check for click
			if (FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.ENTER)
			{
				//trace("(before)event open: "+Events.eventOpen);
				//if (eventOpen)
				if (Events.eventOpen == true && Events.battleOpen == false)
				{
					//trace("closing "+name);
					Events.closeEvent(state, name);
					//Events.eventOpen = false;
					//eventOpen = false;
				}
				else if (Events.eventOpen == false)
				{
					//trace("opening "+name);
					Events.loadEvent(state, name);
					//Events.eventOpen = true;
					//eventOpen = true;
				}
				//trace("(after)event open: "+Events.eventOpen);
			}
		}
	}
}
