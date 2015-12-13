package characters.platform.oneway;
import flixel.FlxObject;

class OneWayDown extends OneWayBase
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/onewaydown.png");
		allowCollisions = FlxObject.DOWN;
	}	
}