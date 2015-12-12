package characters.player;
import flixel.group.FlxSpriteGroup;

class Player extends FlxSpriteGroup
{	
	var _body:PlayerBody;
	
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp);
		add(_body = new PlayerBody());
	}
	
	public function chargeJump(side:String) {
		trace('charge $side jump');
	}
	public function executeJump(side:String) {
		trace('execute $side jump');
	}
	public function executeMiddleJump() {
		trace('execute middle jump');
	}
	
}