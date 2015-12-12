package states;
import flixel.FlxG;
import level.Level;

class PlayState extends BaseState
{
	var _level:Level;
	
	override function onFadeInComplete() {
		FlxG.camera.bgColor = 0xffff00ff;
		init();
	}
	function init() {
		trace('init');
		_level = new Level("assets/maps/dev.tmx");
		add(_level.view);
	}
}