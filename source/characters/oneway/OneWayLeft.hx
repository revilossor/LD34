package characters.oneway;
import flixel.FlxObject;

class OneWayLeft extends Character
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/onewayleft.png");
		immovable = true;
		allowCollisions = FlxObject.LEFT;
	}	
}