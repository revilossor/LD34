package characters.platform.oneway;

class OneWayBase extends Platform
{
	public function new(xp:Float, yp:Float, graphic:Dynamic) 
	{
		super(xp, yp);
		loadGraphic(graphic, true, 32, 32);
		animation.add('idle', [8, 7, 6, 5, 4, 3, 2, 1], Settings.FRAME_RATE);
		animation.play('idle');
	}
	
}