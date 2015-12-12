package states;
import flixel.FlxG;
import level.Level;

class PlayState extends BaseState
{
	var _levelIndex:UInt = 0;
	var _level:Level;
	
	public function new(levelIndex:UInt)
	{
		super();
		_levelIndex = levelIndex;
	}
	override public function create() {
		_level = new Level(Reg.levelPaths[_levelIndex]);
		super.create();
		add(_level.view);
	}
	override function onFadeInComplete() {
		init();
	}
	function init() {
		trace('init');
	}
}