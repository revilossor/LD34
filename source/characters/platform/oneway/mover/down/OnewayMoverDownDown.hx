package characters.platform.oneway.mover.down;

class OnewayMoverDownDown extends OnewayMoverDownBase
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/moverdown.png");
		deltaVee.set(0, Settings.MOVER_VELOCITY_Y);
	}
	
}