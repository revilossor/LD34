package level;
import core.tiled.TiledMap;
import core.tiled.TiledTileSet;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import haxe.io.Path;

class Level extends TiledMap
{
	private inline static var TILESET_BASEPATH = "assets/maps/";
	
	public var collidables:FlxGroup;
	public var view:FlxGroup;
	
	public function new(map:Dynamic) 
	{
 		super(map);
		init();
	}
	function init() {
		trace('init');
		collidables = new FlxGroup();
		view = new FlxGroup();
		initTileLayers();
	}
	function initTileLayers():Void {
		for (tileLayer in layers) {
			var tileSheetName:String = tileLayer.properties.get("tileset");
			if (tileSheetName == null) {
				trace("'tileset' property not defined for the '" + tileLayer.name + "' layer. Please add the property to the layer.");
			}
			var tileSet:TiledTileSet = null;
			for (ts in tilesets) {
				if (ts.name == tileSheetName) {
					tileSet = ts;
					break;
				}
			}
			if (tileSet == null) {
				trace("Tileset '" + tileSheetName + " not found. Did you mispell the 'tilesheet' property in " + tileLayer.name + "' layer?");
			}
			var imagePath = new Path(tileSet.imageSource);
			var processedPath = TILESET_BASEPATH + imagePath.file + "." + imagePath.ext;
			var tilemap:FlxTilemap = new FlxTilemap();
			tilemap.widthInTiles = width;
			tilemap.heightInTiles = height;
			tilemap.loadMap(tileLayer.tileArray, processedPath, tileSet.tileWidth, tileSet.tileHeight, 0, 1, 1, 1);
			view.add(tilemap);
			
			if (tileLayer.properties.get("collidable") == 'true') {
				collidables.add(tilemap);
			}
		}
	}
	function initObjectLayers() {
		for (group in objectGroups) {
		}
	}
	function initImageLayers() {
		for (layer in imageLayers) {
		}
	}

	override public function destroy() {
		collidables.destroy();
		collidables = null;
		view.destroy();
		view = null;
		super.destroy();
	}
}