package characters.oneway;
import characters.Character;
import flixel.FlxObject;

class OneWayDown extends Character
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/onewaydown.png");
		immovable = true;
		allowCollisions = FlxObject.DOWN;
	}	
}