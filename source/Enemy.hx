package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.ui.FlxButton;


class Enemy extends FlxSprite
{
	public var name:String;
	public var maxHealth:Int;
	public var attack:Int;
	
	public function new(X:Int, Y:Int, stats:Array<Dynamic>)
	{
		// X,Y: Starting coordinates
		super(X, Y);
		
		// Make the player graphic.
		//makeGraphic(TILE_SIZE, TILE_SIZE, 0xffc04040);
		loadGraphic(Reg.monsterSprites[stats[0]]);
		health = stats[2];
		maxHealth = stats[2];
		attack = stats[3];
		name = stats[1];
	}
	
	override public function update():Void
	{
		super.update();  
		
	}
}
