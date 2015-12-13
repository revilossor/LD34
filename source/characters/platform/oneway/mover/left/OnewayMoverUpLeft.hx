package characters.platform.oneway.mover.left;

class OnewayMoverUpLeft extends OnewayMoverLeftBase
{

	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/sidemoverup.png");
		deltaVee.set(0, -Settings.MOVER_VELOCITY_Y);
	}
	
}