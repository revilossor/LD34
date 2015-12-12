package states;
import characters.player.Player;
import characters.player.PlayerInputComponent;
import flixel.FlxCamera;
import flixel.FlxG;
import level.Level;

class PlayState extends BaseState
{
	var _levelIndex:UInt = 0;
	var _level:Level;
	
	var _player:Player;
	var _input:PlayerInputComponent;
	
	public function new(levelIndex:UInt)
	{
		super();
		_levelIndex = levelIndex;
	}
	override public function create() {
		_level = new Level(Reg.levelPaths[_levelIndex]);
		_player = new Player(_level.playerSpawnPoint.x + 7, _level.playerSpawnPoint.y - 16);
		_input = new PlayerInputComponent(_player);
		super.create();
		FlxG.worldBounds.set(0, 0, _level.fullWidth, _level.fullHeight);
		FlxG.camera.bounds = FlxG.worldBounds;
		FlxG.camera.follow(_player.hitbox, FlxCamera.STYLE_PLATFORMER);
		
		add(_input);
		
		add(_level.view);
		add(_player);
	}
	override function onFadeInComplete() {
		start();
	}
	function start() {
		trace('start');
	}
	override public function update() {
		super.update();
		FlxG.collide(_player.hitbox, _level.collidables, _player.hitLevel);
	}
}