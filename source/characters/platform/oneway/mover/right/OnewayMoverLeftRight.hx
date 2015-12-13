package characters.platform.oneway.mover.right;

class OnewayMoverLeftRight extends OnewayMoverRightBase
{

	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/sidemoverleft.png");
		deltaVee.set(-Settings.MOVER_VELOCITY_Y, 0);
	}
	
}