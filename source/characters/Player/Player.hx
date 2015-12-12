package characters.player;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;

class Player extends FlxSpriteGroup
{
	var _leftPower:Float;
	var _rightPower:Float;
	
	var _body:PlayerBody;
	
	public function new(xp:Float, yp:Float, leftPower:Float, rightPower:Float) 
	{
		super(xp, yp);
		add(_body = new PlayerBody());
	}
	
}