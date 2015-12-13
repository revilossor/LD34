package characters.platform.sidemover;

class SideMoverRight extends SideMoverBase
{

	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/sidemoverright.png");
		deltaVee.set(Settings.MOVER_VELOCITY_Y, 0);
	}
	
}