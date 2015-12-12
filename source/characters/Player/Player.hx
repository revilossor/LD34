package characters.player;
import flixel.group.FlxSpriteGroup;

class Player extends FlxSpriteGroup
{	
	var _body:PlayerBody;
	var _left:PlayerFoot;
	var _right:PlayerFoot;
	
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp);
		add(_body = new PlayerBody());
		add(_left = new PlayerFoot("left"));
		add(_right = new PlayerFoot("right"));
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