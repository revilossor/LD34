package characters.platform.oneway.mover.up;

class OnewayMoverRightUp extends OnewayMoverUpBase
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/onewaymoverrightup.png");
		deltaVee.set(Settings.MOVER_VELOCITY_X, 0);
	}
	
}