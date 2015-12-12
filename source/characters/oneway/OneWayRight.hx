package characters.oneway;
import flixel.FlxObject;

class OneWayRight extends Character
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/onewayright.png");
		immovable = true;
		allowCollisions = FlxObject.RIGHT;
	}
}