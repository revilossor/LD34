package states;
import characters.player.Player;
import flixel.FlxCamera;
import flixel.FlxG;
import level.Level;

class PlayState extends BaseState
{
	var _levelIndex:UInt = 0;
	var _level:Level;
	
	var _player:Player;
	
	public function new(levelIndex:UInt)
	{
		super();
		_levelIndex = levelIndex;
	}
	override public function create() {
		_level = new Level(Reg.levelPaths[_levelIndex]);
		_player = new Player(_level.playerSpawnPoint.x + 7, _level.playerSpawnPoint.y - 16, Reg.progress.leftPower, Reg.progress.rightPower);
		super.create();
		FlxG.worldBounds.set(0, 0, _level.fullWidth, _level.fullHeight);
		FlxG.camera.bounds = FlxG.worldBounds;
		FlxG.camera.follow(_player, FlxCamera.STYLE_PLATFORMER);
		add(_level.view);
		add(_player);
	}
	override function onFadeInComplete() {
		init();
	}
	function init() {
		trace('init');
	}
}