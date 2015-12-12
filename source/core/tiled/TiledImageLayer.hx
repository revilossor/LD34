package core.tiled;
import haxe.xml.Fast;

class TiledImageLayer
{
	public var imagePath:String;
	public var x:Int;
	public var y:Int;
	public var width:Int;
	public var height:Int;   
	public var visible:Bool;
	public var opacity:Float;
	public var depth:Float;
	
	public function new(source:Fast, parent:TiledMap)
	{
		imagePath = source.node.image.att.source;
		x = (source.has.x) ? Std.parseInt(source.att.x) : 0;
		y = (source.has.y) ? Std.parseInt(source.att.y) : 0;
		width = (source.has.width) ? Std.parseInt(source.att.width) : 0;
		height = (source.has.height) ? Std.parseInt(source.att.height) : 0;
		visible = (source.has.visible && source.att.visible == "0") ? false : true;
		opacity = (source.has.opacity) ? Std.parseFloat(source.att.opacity) : 1.0;
		var properties = source.node.properties;
		for (property in properties.nodes.property) {
			depth = Std.parseFloat(property.att.value);
		}
	}
}