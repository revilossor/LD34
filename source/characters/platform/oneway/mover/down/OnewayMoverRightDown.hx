package characters.platform.oneway.mover.down;

class OnewayMoverRightDown extends OnewayMoverDownBase
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/moverright.png");
		deltaVee.set(-Settings.MOVER_VELOCITY_Y, 0);
	}
	
}