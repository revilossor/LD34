package core.util;
import flixel.util.FlxPoint;

class FlxPointFunc
{	
	public static function addVec(a:FlxPoint, b:FlxPoint):FlxPoint {
		return FlxPoint.get(a.x + b.x, a.y + b.y);
	}
	public static function subVec(a:FlxPoint, b:FlxPoint):FlxPoint {
		return FlxPoint.get(a.x - b.x, a.y - b.y);
	}
	public static function divVec(a:FlxPoint, b:FlxPoint):FlxPoint {
		return FlxPoint.get(a.x / b.x, a.y / b.y);
	}
	public static function mulVec(a:FlxPoint, b:FlxPoint):FlxPoint {
		return FlxPoint.get(a.x * b.x, a.y * b.y);
	}
	public static function dot(a:FlxPoint, b:FlxPoint):Float {
		return (a.x * b.x) + (a.y * b.y);
	}
	public static function getAngle(of:FlxPoint, with:FlxPoint):Float {
		// a.b = |a| x |b| x cos(theta)		=	cos(theta) = a.b / (|a| x |b|)
		return (Math.acos(dot(of, with ) / (getMagnitude(of) * getMagnitude(with)))) * (180 / Math.PI);		// in degrees
	}
	public static function getBetween(a:FlxPoint, b:FlxPoint):FlxPoint {
		return FlxPoint.get(b.x - a.x, b.y - a.y);
	}
	public static function getUnitBetween(a:FlxPoint, b:FlxPoint):FlxPoint {
		return getUnit(getBetween(a, b));
	}
	public static function getDistanceBetween(a:FlxPoint, b:FlxPoint):Float {
		return getMagnitude(getBetween(a, b)); 
	}
	public static function getMagnitude(v:FlxPoint):Float {
		return Math.sqrt(Math.pow(v.x, 2) + Math.pow(v.y, 2));
	}
	public static function getMagnitudeSq(v:FlxPoint):Float {
		return Math.pow(v.x, 2) + Math.pow(v.y, 2);
	}
	public static function getUnit(v:FlxPoint):FlxPoint {
		var mag:Float = getMagnitude(v);
		return FlxPoint.get(v.x / mag, v.y / mag);
	}
	public static function getNormals(a:FlxPoint):Array<FlxPoint> {
		var ret:Array<FlxPoint> = new Array<FlxPoint>();
		ret.push(FlxPoint.get( -a.y, a.x));
		ret.push(FlxPoint.get(a.y, -a.x));
		return ret;
	}
	public static function setMagnitude(v:FlxPoint, m:Float):FlxPoint {
		return magnify(getUnit(v), m);
	}
	public static function magnify(v:FlxPoint, m:Float):FlxPoint {
		return FlxPoint.get(v.x * m, v.y * m);
	}
	public static function isDistanceLessThan(a:FlxPoint, b:FlxPoint, threshold:Float):Bool {
		return getMagnitudeSq(getBetween(a, b)) <= (threshold * threshold) ? true : false;
	}
	public static function isDistanceGreaterThan(a:FlxPoint, b:FlxPoint, threshold:Float):Bool {
		return getMagnitudeSq(getBetween(a, b)) <= (threshold * threshold) ? true : false;
	}
	public static function rotate(v:FlxPoint, by:Float):FlxPoint {
		return rotateRadians(v, by * (Math.PI / 180));
	}
	public static function rotateRadians(v:FlxPoint, by:Float):FlxPoint {
		var ca = Math.cos(by);
        var sa = Math.sin(by);
        return FlxPoint.get(ca * v.x - sa * v.y, sa * v.x + ca * v.y);
	}
	public static function rotateDegrees(v:FlxPoint, by:Float) {
		return rotateRadians(v, by * (Math.PI / 180));
	}
}