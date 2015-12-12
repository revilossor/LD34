package level;
import core.tiled.TiledMap;
import core.tiled.TiledTileSet;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxPoint;
import haxe.io.Path;

class Level extends TiledMap
{
	private inline static var TILESET_BASEPATH = "assets/maps/";
	
	public var collidables:FlxGroup;
	public var view:FlxGroup;
	public var playerSpawnPoint:FlxPoint;
	
	public function new(map:Dynamic) 
	{
 		super(map);
		init();
	}
	function init() {
		trace('init');
		collidables = new FlxGroup();
		view = new FlxGroup();
		playerSpawnPoint = new FlxPoint(32, 32);
		initTileLayers();
		initObjectLayers();
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
			for(character in group.objects) {
				trace('\tinit character ${character.type} at ${character.x}, ${character.y}');
				switch(character.type) {
					case CharacterTypes.PLAYER_START : playerSpawnPoint = FlxPoint.weak(character.x, character.y);
				}
			}
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