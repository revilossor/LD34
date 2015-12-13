package characters.platform.sidemover;

class SideMoverLeft extends SideMoverBase
{

	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/sidemoverleft.png");
		deltaVee.set(-Settings.MOVER_VELOCITY_Y, 0);
	}
	
}