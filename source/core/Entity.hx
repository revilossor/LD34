package core;
import flixel.FlxSprite;

class Entity extends FlxSprite
{
	var _notSeen:Bool = true;
	public function new(?x:Float = 0, ?y:Float = 0, ?graphic:Dynamic = null)
	{
		super(x, y, graphic);	
	}
	override public function update() {
		killIfOffScreen();
		super.update();
	}
	function killIfOffScreen() {
		if (_notSeen && isOnScreen()) {
			_notSeen = false;
		} else if (!_notSeen && !isOnScreen()) {
			this.kill();
		}
	}
	public function renew() {
		alive = exists = _notSeen = true;
	}
	
}