package characters.platform.oneway.mover.left;

class OnewayMoverRightLeft extends OnewayMoverLeftBase
{

	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/onewaymoverrightleft.png");
		deltaVee.set(Settings.MOVER_VELOCITY_Y, 0);
	}
	
}