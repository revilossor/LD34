package characters.platform.oneway.mover.left;
import flixel.FlxObject;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.tweens.misc.VarTween;
import flixel.util.FlxPoint;

class OnewayMoverLeftBase extends Platform
{
	public var deltaVee:FlxPoint;
	var _tween:VarTween;
	var _tweenBack:VarTween;
	var _startX:Float;
	var _startY:Float;
	
	public function new(?xp:Float = 0, ?yp:Float = 0, ?graphic:Dynamic = null) 
	{
		super(_startX = xp, _startY = yp);
		deltaVee = FlxPoint.weak();
		loadGraphic(graphic, true, 16, 32);
		animation.add('idle', [2]);
		animation.add('active', [2, 3, 4, 5, 6, 7, 8], Settings.FRAME_RATE);
		animation.add('inactive', [1]);
		animation.play('idle');
	}
	override public function update() {
		if (isTouching(FlxObject.ANY)) {
			if (_tweenBack != null) { _tweenBack.cancel(); _tweenBack.destroy(); _tweenBack = null; }
			if(_tween == null) {
				_tween = FlxTween.tween(velocity, { x:deltaVee.x, y:deltaVee.y }, 0.5, { type:FlxTween.ONESHOT } );
				animation.play('active');
			}
		}
		else {
			if (_tween != null) { 
				_tween.cancel(); 
				_tween.destroy(); 
				_tween = null; 
				if (_tweenBack == null) {
					animation.play('inactive');
					_tweenBack = FlxTween.tween(this, { x:_startX, y:_startY }, 3, { type:FlxTween.ONESHOT, ease:FlxEase.cubeInOut, complete:function(tween) {
						animation.play('idle');
					} } );
				}
			}
			velocity.x *= 0.8;
			velocity.y *= 0.8;
		}
		super.update();
	}
}