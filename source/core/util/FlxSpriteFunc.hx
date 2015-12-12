package core.util;
import flixel.FlxSprite;
import openfl.display.BitmapData;
import openfl.display.BitmapDataChannel;
import openfl.geom.Point;
import openfl.geom.Rectangle;

class FlxSpriteFunc
{
	public static function mask(sprite:FlxSprite, mask:FlxSprite):BitmapData {
		sprite.drawFrame();
		var spriteData:BitmapData = sprite.pixels.clone();
		spriteData.copyChannel(mask.pixels, new Rectangle(0, 0, sprite.width, sprite.height), new Point(), BitmapDataChannel.ALPHA, BitmapDataChannel.ALPHA);
		return alphaHack(spriteData);
	}
	private static function alphaHack(target:BitmapData) { // this is a hack to fix a problem with BitmapData.copyChannel ignoring the alpha channel in the source image
		var data = target.clone();
		#if android
			data.threshold(data, new Rectangle(0, 0, target.width, target.height), new Point(), ">=", 0xfff0f0f0, 0x00000000);
		#else
			data.threshold(data, new Rectangle(0, 0, target.width, target.height), new Point(), "<=", 0xff000000, 0x00000000);
		#end
		return data;
	}
	
}