package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;


class SpeechWindow extends FlxGroup
{
	public var eventWindow:FlxSprite;
	public var characterWindow:FlxSprite;
	public var character:FlxSprite;
	
	public function new(text:String, char:String)
	{
		super();
		
		eventWindow = new FlxSprite(0, 100, Reg.dialogWindow);
		eventWindow.x = (FlxG.width / 2) - (eventWindow.width / 2);
		add(eventWindow);
		Reg.text = new FlxText(eventWindow.x + 110, eventWindow.y + 30, 360, text);
		Reg.text.size = 20;
		Reg.text.alignment = "left";
		add(Reg.text);
		characterWindow = new FlxSprite(eventWindow.x, eventWindow.y - 30, Reg.speakerWindow);
		add(characterWindow);
		character = new FlxSprite(0, 0, char);
		character.x = (characterWindow.x + (characterWindow.width / 2)) - (character.width / 2);
		character.y = (characterWindow.y + (characterWindow.height / 2)) - (character.height / 2);
		add(character);
	}
	
	override public function update():Void
	{
		super.update();  
	}
}
