package characters.platform.oneway.mover;

class MoverUp extends MoverBase
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/moverup.png");
		deltaVee.set(0, -Settings.MOVER_VELOCITY_Y);
	}
	
}