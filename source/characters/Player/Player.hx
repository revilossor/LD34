package characters.player;
import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.tweens.FlxTween;
import flixel.tweens.misc.VarTween;

class Player extends FlxGroup
{	
	public var hitbox:FlxSprite;
	
	var _body:PlayerBody;
	var _left:PlayerFoot;
	var _right:PlayerFoot;
	
	var _leftCharge:Float = 0;	// 0-1
	var _rightCharge:Float = 0;	// 0-1
	var _chargingLeft:Bool;
	var _chargingRight:Bool;
	
	var _canJump:Bool = false;
	
	var _leftTween:VarTween;
	var _rightTween:VarTween;
	
	public function new(xp:Float, yp:Float) 
	{
		super();
		hitbox = new FlxSprite(xp, yp);
		hitbox.makeGraphic(8, 16, 0x00ff00ff);
		add(hitbox);
		add(_body = new PlayerBody());
		add(_left = new PlayerFoot("left"));
		add(_right = new PlayerFoot("right"));
		startJump();
		hitbox.velocity.set();
		hitbox.maxVelocity.set(1000, 1000);
		hitbox.drag.set(130, 150);
		hitbox.acceleration.set(0, Settings.PLAYER_GRAVITY);
	}
	
	override public function update() {
		super.update();
		positionElements();
	}
	function positionElements() {
		_body.x = hitbox.x - 4;			_body.y = hitbox.y - 1;
		_left.x = hitbox.x - 4;			_left.y = hitbox.y + 15 - (Settings.PLAYER_FOOT_CHARGE_OFFSET * _leftCharge);	
		_right.x = hitbox.x + 9 - 4;	_right.y = hitbox.y + 15 - (Settings.PLAYER_FOOT_CHARGE_OFFSET * _rightCharge);	
	}
	
	public function hitSolid(player:FlxSprite, solid:FlxBasic) {
		if (_canJump == false) {	// in air
 		}
		_canJump = _left.visible = _right.visible = true;
	}
	public function startJump() {
		_chargingLeft = _chargingRight = _canJump = _left.visible = _right.visible = false;
		if(_leftTween != null) { _leftTween.cancel(); }
		if(_rightTween != null) { _rightTween.cancel(); }
		_leftCharge = _rightCharge = 0;
	}
	public function chargeJump(side:String) {
		if (side == "left") {
			if(_leftTween != null) { _leftTween.cancel(); }
			_leftCharge = 0;
			_chargingLeft = _left.visible = true;
			_leftTween = FlxTween.tween(this, { _leftCharge:1 }, Settings.PLAYER_CHARGE_SPEED, { type:FlxTween.ONESHOT, complete:chargeComplete} );
			return;
		}
		if (_rightTween != null) { _rightTween.cancel(); }
		_rightCharge = 0;
		_chargingRight = _right.visible = true;
		_rightTween = FlxTween.tween(this, { _rightCharge:1 }, Settings.PLAYER_CHARGE_SPEED, { type:FlxTween.ONESHOT, complete:chargeComplete } );
	}
	function chargeComplete(tween:FlxTween) {
		tween.cancel();
		tween.destroy();
	}
	public function executeJump(side:String) {
		if (!_canJump) { startJump(); return; }
		if (side == "left") {
			hitbox.velocity.set( -(Settings.PLAYER_JUMP_DELTA_X * _leftCharge), -(Reg.progress.leftPower * _leftCharge));
			startJump();
			_body.facing = FlxObject.RIGHT;
			return;
		}
		_body.facing = FlxObject.LEFT;
		hitbox.velocity.set( (Settings.PLAYER_JUMP_DELTA_X * _rightCharge), -(Reg.progress.rightPower * _rightCharge));
		startJump();
	}
	public function executeMiddleJump() {
		if (!_canJump) { startJump(); return; }
		hitbox.velocity.set(0, -(((Reg.progress.rightPower + Reg.progress.leftPower) / 2) * ((_rightCharge + _leftCharge) / 2)));
		startJump();
	}
}