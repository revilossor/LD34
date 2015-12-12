package level;
import characters.Character;
import flixel.group.FlxGroup;

class LevelCharacterGroup extends FlxGroup
{
	public var oneWayUps:FlxGroup;
	public var oneWayDowns:FlxGroup;
	public var oneWayLefts:FlxGroup;
	public var oneWayRights:FlxGroup;
	
	public var moverUps:FlxGroup;
	public var moverDowns:FlxGroup;
	public var moverLefts:FlxGroup;
	public var moverRights:FlxGroup;
	
	public function new() 
	{
		super();
		add(oneWayUps = new FlxGroup());
		add(oneWayDowns = new FlxGroup());
		add(oneWayLefts = new FlxGroup());
		add(oneWayRights = new FlxGroup());
		add(moverUps = new FlxGroup());
		add(moverDowns = new FlxGroup());
		add(moverLefts = new FlxGroup());
		add(moverRights = new FlxGroup());
	}	
}