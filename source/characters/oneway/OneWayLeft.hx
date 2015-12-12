package characters.oneway;
import flixel.FlxObject;

class OneWayLeft extends OneWayBase
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/onewayleft.png");
		allowCollisions = FlxObject.LEFT;
	}	
}