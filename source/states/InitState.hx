package states;
import flixel.FlxG;

class InitState extends BaseState
{
	override function onFadeInComplete() {
		FlxG.camera.bgColor = 0xff1e1e1e;
		init();
	}
	function init() {
		trace('init');
		Reg.progress = new Progress();	// TODO load and parse ?
		onInitComplete();
	}
	function onInitComplete() {
		trace('init complete');
		switchState(MenuState);
	}
}