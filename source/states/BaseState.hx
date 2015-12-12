package states;
import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;

class BaseState extends FlxState
{
	override public function create() {
		super.create();
		FlxG.camera.fade(FlxColor.BLACK, 0.2, true, function() {
			onFadeInComplete();
		});
	}
	function onFadeInComplete() {}
	function switchState(to:Class<BaseState>) {
		FlxG.camera.fade(FlxColor.BLACK, 0.2, false, function() {
			FlxG.switchState(Type.createInstance(to, []));
		});
	}
}