package;
 
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.group.FlxGroup;
import flixel.ui.FlxButton;
import flixel.util.FlxPoint;
 
/**
 * ...
 * @author .:BuzzJeux:.
 */
class PlayState extends FlxState
{
	public var player:Player;
	private var _level:TiledLevel;
	public var touchinggood:Bool;
	public var touchingbad:Bool;
	
	override public function create():Void
	{
		FlxG.mouse.visible = false;
		
		touchingbad = false;
		touchinggood = false;
		// Load the level's tilemaps
		_level = new TiledLevel("assets/data/alex_meadow.tmx");
		
		// Add tilemaps
		add(_level.backgroundTiles);
		
		// Add tilemaps
		add(_level.foregroundTiles);
		
		// Load player and objects of the Tiled map
		_level.loadObjects(this);
	}
	
	override public function update():Void
	{
		super.update();
		
		// Collide with foreground tile layer
		if (_level.collideWithLevel(player))
		{
			// Resetting the movement flag if the player hits the wall 
			// is crucial, otherwise you can get stuck in the wall
			player.moveToNextTile = false;
		}
		
		//search through nodes to see if the player is touching one of them.
		for (node in Reg.nodesGood)
		{
			node.checkCollision(player, this);
			node.checkForEvent(this);
		}
		
		for (node in Reg.nodesBad)
		{
			node.checkCollision(player, this);
			node.checkForEvent(this);
		}
	}
	
	override public function destroy():Void
	{
		super.destroy();
		
		player = null;
		_level = null;
		//_howto = null;
	}
}
