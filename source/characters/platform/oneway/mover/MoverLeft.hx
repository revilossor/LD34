package characters.platform.oneway.mover;

class MoverLeft extends MoverBase
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/moverleft.png");
		deltaVee.set(Settings.MOVER_VELOCITY_Y, 0);
	}
	
}