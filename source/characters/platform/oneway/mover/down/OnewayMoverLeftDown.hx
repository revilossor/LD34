package characters.platform.oneway.mover.down;

class OnewayMoverLeftDown extends OnewayMoverDownBase
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/moverleft.png");
		deltaVee.set(Settings.MOVER_VELOCITY_Y, 0);
	}
	
}