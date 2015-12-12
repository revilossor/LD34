package characters;
import flixel.FlxSprite;

class Character extends FlxSprite
{
	var _notSeen:Bool = true;
	
	public function new(?xp:Float = 0, ?yp:Float = 0, ?graphic:Dynamic = null) 
	{
		super(xp, yp, graphic);
	}
	override public function update() {
		if (_notSeen && isOnScreen()) {
			_notSeen = false;
			super.update();
		} else if (!_notSeen && isOnScreen()) {
			super.update();
		}
	}
	
}