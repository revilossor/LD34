package characters.platform.sidemover;

class SideMoverDown extends SideMoverBase
{

	public function new(xp:Float, yp:Float) 
	{
		super(xp, yp, "assets/gfx/sidemoverdown.png");
		deltaVee.set(0, Settings.MOVER_VELOCITY_Y);
	}
	
}