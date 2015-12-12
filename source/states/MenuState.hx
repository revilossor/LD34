package states;
import flixel.FlxG;
import flixel.FlxSprite;

class MenuState extends BaseState
{
	override function onFadeInComplete() {
		add(new FlxSprite(0, 0, "assets/gfx/menubg.png"));
	}
	override public function update() {
		inputHandling();
		super.update();
	}
	function inputHandling() {
		if (FlxG.mouse.justReleased) {
			switchState(PlayState, [Reg.progress.levelIndex]);
		}
	}
	
}