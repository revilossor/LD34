package characters.platform.mover;

class MoverLeft extends MoverBase
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/moverleft.png");
		deltaVee.set(-Settings.MOVER_VELOCITY_X, 0);
	}
	
}