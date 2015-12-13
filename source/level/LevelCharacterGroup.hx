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
	public var sideMoverUps:FlxGroup;
	public var sideMoverDowns:FlxGroup;
	public var sideMoverLefts:FlxGroup;
	public var sideMoverRights:FlxGroup;
	public var OneWayMoverUpUps:FlxGroup;
	public var OneWayMoverDownUps:FlxGroup;
	public var OneWayMoverLeftUps:FlxGroup;
	public var OneWayMoverRightUps:FlxGroup;
	public var OneWayMoverUpDowns:FlxGroup;
	public var OneWayMoverDownDowns:FlxGroup;
	public var OneWayMoverLeftDowns:FlxGroup;
	public var OneWayMoverRightDowns:FlxGroup;
	public var OneWayMoverUpLefts:FlxGroup;
	public var OneWayMoverDownLefts:FlxGroup;
	public var OneWayMoverLeftLefts:FlxGroup;
	public var OneWayMoverRightLefts:FlxGroup;
	public var OneWayMoverUpRights:FlxGroup;
	public var OneWayMoverDownRights:FlxGroup;
	public var OneWayMoverLeftRights:FlxGroup;
	public var OneWayMoverRightRights:FlxGroup;
	
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
		add(sideMoverUps = new FlxGroup());
		add(sideMoverDowns = new FlxGroup());
		add(sideMoverLefts = new FlxGroup());
		add(sideMoverRights = new FlxGroup());
		add(OneWayMoverUpUps = new FlxGroup());
		add(OneWayMoverDownUps = new FlxGroup());
		add(OneWayMoverLeftUps = new FlxGroup());
		add(OneWayMoverRightUps = new FlxGroup());
		add(OneWayMoverUpDowns = new FlxGroup());
		add(OneWayMoverDownDowns = new FlxGroup());
		add(OneWayMoverLeftDowns = new FlxGroup());
		add(OneWayMoverRightDowns = new FlxGroup());
		add(OneWayMoverUpLefts = new FlxGroup());
		add(OneWayMoverDownLefts = new FlxGroup());
		add(OneWayMoverLeftLefts = new FlxGroup());
		add(OneWayMoverRightLefts = new FlxGroup());
		add(OneWayMoverUpRights = new FlxGroup());
		add(OneWayMoverDownRights = new FlxGroup());
		add(OneWayMoverLeftRights = new FlxGroup());
		add(OneWayMoverRightRights = new FlxGroup());
	}
}