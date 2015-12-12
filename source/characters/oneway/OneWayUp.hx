package characters.oneway;
import characters.Character;
import flixel.FlxObject;

class OneWayUp extends Character
{

	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/onewayup.png");
		immovable = true;
		allowCollisions = FlxObject.UP;
	}
}