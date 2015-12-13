package characters.platform.oneway.mover.left;

class OnewayMoverDownLeft extends OnewayMoverLeftBase
{

	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/onewaymoverdownleft.png");
		deltaVee.set(0, Settings.MOVER_VELOCITY_Y);
	}
	
}