package characters.platform.oneway.mover.left;

class OnewayMoverLeftLeft extends OnewayMoverLeftBase
{

	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/sidemoverleft.png");
		deltaVee.set(-Settings.MOVER_VELOCITY_Y, 0);
	}
	
}