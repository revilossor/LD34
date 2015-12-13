package characters.platform;

class Platform extends Character
{
	public function new(?xp:Float = 0, ?yp:Float = 0, ?graphic:Dynamic = null) 
	{
		super(xp, yp, graphic);
		immovable = true;
	}
	
}