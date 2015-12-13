package characters.platform.oneway;
import flixel.FlxObject;

class OneWayRight extends OneWayBase
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/onewayright.png");
		allowCollisions = FlxObject.RIGHT;
	}
}