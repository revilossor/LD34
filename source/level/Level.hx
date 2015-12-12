package level;
import characters.oneway.OneWayDown;
import characters.oneway.OneWayLeft;
import characters.oneway.OneWayRight;
import characters.oneway.OneWayUp;
import characters.player.Player;
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
	public var characters:LevelCharacterGroup;
	
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
		initPlayerStart();
	}
	public function initCharacters(player:Player) {
		characters = new LevelCharacterGroup();
		for (group in objectGroups) {
			for(character in group.objects) {
				trace('\tinit character ${character.type} at ${character.x}, ${character.y}');
				switch(character.type) {
					case CharacterTypes.ONE_WAY_UP : characters.oneWayUps.add(new OneWayUp(character.x, character.y - 32));
					case CharacterTypes.ONE_WAY_DOWN : characters.oneWayUps.add(new OneWayDown(character.x, character.y - 32));
					case CharacterTypes.ONE_WAY_LEFT : characters.oneWayUps.add(new OneWayLeft(character.x, character.y - 32));
					case CharacterTypes.ONE_WAY_RIGHT : characters.oneWayUps.add(new OneWayRight(character.x, character.y - 32));
				}
			}
		}
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
	function initPlayerStart() {
		for (group in objectGroups) {
			for(character in group.objects) {
				if(character.type == CharacterTypes.PLAYER_START) { playerSpawnPoint = FlxPoint.weak(character.x, character.y);	}
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