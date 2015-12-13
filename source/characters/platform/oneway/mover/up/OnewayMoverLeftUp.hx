package characters.platform.oneway.mover.up;

class OnewayMoverLeftUp extends OnewayMoverUpBase
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/moverleft.png");
		deltaVee.set(Settings.MOVER_VELOCITY_Y, 0);
	}
	
}