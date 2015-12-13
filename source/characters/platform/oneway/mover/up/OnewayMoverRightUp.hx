package characters.platform.oneway.mover.up;

class OnewayMoverRightUp extends OnewayMoverUpBase
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/moverright.png");
		deltaVee.set(-Settings.MOVER_VELOCITY_Y, 0);
	}
	
}