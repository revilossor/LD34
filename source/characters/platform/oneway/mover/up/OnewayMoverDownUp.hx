package characters.platform.oneway.mover.up;

class OnewayMoverDownUp extends OnewayMoverUpBase
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/moverdown.png");
		deltaVee.set(0, Settings.MOVER_VELOCITY_Y);
	}
	
}