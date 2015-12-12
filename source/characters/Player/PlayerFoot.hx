package characters.player;
import flixel.FlxObject;
import flixel.FlxSprite;

class PlayerFoot extends FlxSprite
{
	var _side:String;
	
	public function new(side:String) 
	{
		super(0, 0, "assets/gfx/playerFoot.png");
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);
		_side = side;
		if (_side == "left") {
			facing = FlxObject.LEFT;
			x = 0;
		}else {
			facing = FlxObject.RIGHT;
			x = 9;
		}
		y = 16;
	}
	
}