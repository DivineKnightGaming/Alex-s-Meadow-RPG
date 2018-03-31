package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	private var _switchTimer:Float;
	public var eventWindow:FlxSprite;
	private var _level:TiledLevel;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		FlxG.mouse.visible = false;
		
		_level = new TiledLevel("assets/data/alex_meadow2.tmx");
		
		// Add tilemaps
		add(_level.backgroundTiles);
		
		// Add tilemaps
		add(_level.foregroundTiles);
		
		eventWindow = new FlxSprite(0, 100, Reg.dialogWindow);
		eventWindow.x = (FlxG.width / 2) - (eventWindow.width / 2);
		add(eventWindow);
		Reg.text = new FlxText(10,130,502,"Alex's Meadow RPG");
		Reg.text.size = 40;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		Reg.button = new FlxButton((FlxG.width/2) - 80, 200, "Play!", goToGame);
		Reg.button.loadGraphic(Reg.buttonImg,false,160,40);
		Reg.button.label = new FlxText(0,0,160,"Play!");
		Reg.button.label.setFormat(null, 22, 0xffffff, "center");
		add(Reg.button);
		
		Reg.pointerSp = new FlxSprite(Reg.button.x+Reg.button.width-32,Reg.button.y+Reg.button.height/2,Reg.pointerImg);
		add(Reg.pointerSp);
	}
	
	private function goToGame():Void
	{
		FlxG.switchState(new PlayerSelectState());
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		//_switchTimer -= FlxG.elapsed;
		if (FlxG.keys.justPressed.SPACE)
		{
			this.goToGame();
		}
	}	
}