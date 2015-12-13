package characters.platform.oneway.mover.up;

class OnewayMoverUpUp extends OnewayMoverUpBase
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/onewaymoverupup.png");
		deltaVee.set(0, -Settings.MOVER_VELOCITY_Y);
	}
	
}