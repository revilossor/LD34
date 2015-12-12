package states;
import flixel.FlxG;

class PlayState extends BaseState
{
	override function onFadeInComplete() {
		FlxG.camera.bgColor = 0xffff00ff;
		init();
	}
	function init() {
		trace('init');
	}
}