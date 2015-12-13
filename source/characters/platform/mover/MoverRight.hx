package characters.platform.mover;

class MoverRight extends MoverBase
{
	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/moverright.png");
		deltaVee.set(-Settings.MOVER_VELOCITY_Y, 0);
	}
	
}