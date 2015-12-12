package characters.player;
import flixel.FlxObject;
import flixel.FlxSprite;

class PlayerFoot extends FlxSprite
{
	var _side:String;
	
	public function new(side:String) 
	{
		super(0, 0, "assets/gfx/playerFoot.png");
		_side = side;
	}
	
}