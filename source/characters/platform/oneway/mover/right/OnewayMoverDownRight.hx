package characters.platform.oneway.mover.right;

class OnewayMoverDownRight extends OnewayMoverRightBase
{

	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/sidemoverdown.png");
		deltaVee.set(0, Settings.MOVER_VELOCITY_Y);
	}
	
}