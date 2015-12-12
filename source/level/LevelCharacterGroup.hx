package level;
import characters.Character;
import flixel.group.FlxGroup;

class LevelCharacterGroup extends FlxGroup
{
	public var oneWayUps:FlxGroup;
	public var oneWayDowns:FlxGroup;
	public var oneWayLefts:FlxGroup;
	public var oneWayRights:FlxGroup;
	
	public function new() 
	{
		super();
		add(oneWayUps = new FlxGroup());
		add(oneWayDowns = new FlxGroup());
		add(oneWayLefts = new FlxGroup());
		add(oneWayRights = new FlxGroup());
	}	
}