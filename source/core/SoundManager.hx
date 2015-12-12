package core;
import flixel.FlxG;

class SoundManager
{
	public function new() {}

	public function playEffect(id:String, volume:Float) {
		FlxG.sound.play(getPlatformId(id), getVolume(volume, masterVolume));
	}
	public function playMusic(id:String, volume:Float) {
		FlxG.sound.playMusic(getPlatformId(id), getVolume(volume, masterVolume));
	}
	public function stopMusic() {
		FlxG.sound.music.stop();
	}
	
	function getVolume(volume:Float, masterVolume:Float) {
		return masterVolume * ((volume < 0) ? 0 : (volume > 1) ? 1 : volume);
	}
	function getPlatformId(id) {
		#if android
			return id + '-ogg';
		#else
			return id + '-mp3';
		#end
	}
	
	@:isVar public var muted(get, set):Bool = false;
	public function get_muted():Bool { return muted; }
	public function set_muted(to:Bool) {
		return muted = to;
	}
	@:isVar public var masterVolume(get, set):Float = Settings.MASTER_VOLUME;
	public function get_masterVolume():Float { return masterVolume; }
	public function set_masterVolume(to:Float) {
		return masterVolume = (to < 0) ? 0 : (to > 1) ? 1 : to;
	}
}