package characters.platform.oneway.mover.left;

class OnewayMoverLeftLeft extends OnewayMoverLeftBase
{

	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/onewaymoverleftleft.png");
		deltaVee.set(-Settings.MOVER_VELOCITY_Y, 0);
	}
	
}