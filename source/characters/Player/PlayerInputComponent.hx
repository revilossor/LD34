package characters.player;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup;

class PlayerInputComponent extends FlxGroup
{
	var _player:Player;
	var _leftPressed:Bool = false;
	var _rightPressed:Bool = false;
	
	public function new(player:Player) 
	{
		super();
		_player = player;
	}
	override public function update() {
		inputHandling();
		super.update();
	}
	function inputHandling() {
		if (FlxG.keys.anyJustPressed(Keys.LEFT)) { onLeftPressed(); }
		if (FlxG.keys.anyJustPressed(Keys.RIGHT)) { onRightPressed(); }
		if (FlxG.keys.anyJustReleased(Keys.LEFT)) { onLeftReleased(); }
		if (FlxG.keys.anyJustReleased(Keys.RIGHT)) { onRightReleased(); }
	}
	function onLeftPressed() {
		if (_leftPressed) { return; }
		_player.chargeJump("left");
		_leftPressed = true; 
	}
	function onRightPressed() {
		if (_rightPressed) { return; }
		_player.chargeJump("right");
		_rightPressed = true; 
	}
	function onLeftReleased() {
		if (!_leftPressed) { return; }
		if (_rightPressed) {
			_player.executeMiddleJump();
			_rightPressed = false;
		} else {
			_player.executeJump("left");
		}
		_leftPressed = false; 
	}
	function onRightReleased() {
		if (!_rightPressed) { return; }
		if (_leftPressed) {
			_player.executeMiddleJump();
			_leftPressed = false;
		} else {
			_player.executeJump("right");
		}
		_rightPressed = false; 
	}
}