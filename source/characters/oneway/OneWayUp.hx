package characters.oneway;
import characters.Character;
import flixel.FlxObject;

class OneWayUp extends OneWayBase
{

	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/onewayup.png");
		allowCollisions = FlxObject.UP;
	}
}