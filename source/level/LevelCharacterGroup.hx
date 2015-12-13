package level;
import flixel.group.FlxGroup;

class LevelCharacterGroup extends FlxGroup
{
	public var platforms:FlxGroup;
	
	public function new() 
	{
		super();
		add(platforms = new FlxGroup());
	}
}