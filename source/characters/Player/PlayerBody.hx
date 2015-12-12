package characters.player;
import flixel.FlxObject;
import flixel.FlxSprite;

class PlayerBody extends FlxSprite
{
	public function new() 
	{
		super(0, 0, "assets/gfx/playerBody.png");
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);
		facing = FlxObject.LEFT;
	}
	
}