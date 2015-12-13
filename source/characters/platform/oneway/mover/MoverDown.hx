package characters.platform.oneway.mover;

class MoverDown extends MoverBase
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/moverdown.png");
		deltaVee.set(0, Settings.MOVER_VELOCITY_Y);
	}
	
}