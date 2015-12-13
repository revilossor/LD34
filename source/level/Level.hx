package level;
import characters.platform.mover.MoverDown;
import characters.platform.mover.MoverLeft;
import characters.platform.mover.MoverRight;
import characters.platform.mover.MoverUp;
import characters.platform.oneway.mover.left.OnewayMoverDownLeft;
import characters.platform.oneway.mover.left.OnewayMoverLeftLeft;
import characters.platform.oneway.mover.left.OnewayMoverRightLeft;
import characters.platform.oneway.mover.left.OnewayMoverUpLeft;
import characters.platform.oneway.mover.up.OnewayMoverDownUp;
import characters.platform.oneway.mover.up.OnewayMoverLeftUp;
import characters.platform.oneway.mover.up.OnewayMoverRightUp;
import characters.platform.oneway.mover.up.OnewayMoverUpUp;
import characters.platform.oneway.OneWayDown;
import characters.platform.oneway.OneWayLeft;
import characters.platform.oneway.OneWayRight;
import characters.platform.oneway.OneWayUp;
import characters.platform.sidemover.SideMoverDown;
import characters.platform.sidemover.SideMoverLeft;
import characters.platform.sidemover.SideMoverRight;
import characters.platform.sidemover.SideMoverUp;
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
				switch(character.type) {
					case CharacterTypes.ONE_WAY_UP : characters.platforms.add(new OneWayUp(character.x, character.y - 32));
					case CharacterTypes.ONE_WAY_DOWN : characters.platforms.add(new OneWayDown(character.x, character.y - 32));
					case CharacterTypes.ONE_WAY_LEFT : characters.platforms.add(new OneWayLeft(character.x, character.y - 32));
					case CharacterTypes.ONE_WAY_RIGHT : characters.platforms.add(new OneWayRight(character.x, character.y - 32));
					case CharacterTypes.MOVER_UP : characters.platforms.add(new MoverUp(character.x, character.y - 32));
					case CharacterTypes.MOVER_DOWN : characters.platforms.add(new MoverDown(character.x, character.y - 32));
					case CharacterTypes.MOVER_LEFT : characters.platforms.add(new MoverLeft(character.x, character.y - 32));
					case CharacterTypes.MOVER_RIGHT : characters.platforms.add(new MoverRight(character.x, character.y - 32));
					case CharacterTypes.SIDE_MOVER_UP : characters.platforms.add(new SideMoverUp(character.x, character.y - 32));
					case CharacterTypes.SIDE_MOVER_DOWN : characters.platforms.add(new SideMoverDown(character.x, character.y - 32));
					case CharacterTypes.SIDE_MOVER_LEFT : characters.platforms.add(new SideMoverLeft(character.x, character.y - 32));
					case CharacterTypes.SIDE_MOVER_RIGHT : characters.platforms.add(new SideMoverRight(character.x, character.y - 32));
					case CharacterTypes.ONE_WAY_MOVER_UP_UP : characters.platforms.add(new OnewayMoverUpUp(character.x, character.y - 32));
					case CharacterTypes.ONE_WAY_MOVER_DOWN_UP : characters.platforms.add(new OnewayMoverDownUp(character.x, character.y - 32));
					case CharacterTypes.ONE_WAY_MOVER_LEFT_UP : characters.platforms.add(new OnewayMoverLeftUp(character.x, character.y - 32));
					case CharacterTypes.ONE_WAY_MOVER_RIGHT_UP : characters.platforms.add(new OnewayMoverRightUp(character.x, character.y - 32));
					case CharacterTypes.ONE_WAY_MOVER_UP_LEFT : characters.platforms.add(new OnewayMoverUpLeft(character.x, character.y - 32));
					case CharacterTypes.ONE_WAY_MOVER_DOWN_LEFT : characters.platforms.add(new OnewayMoverDownLeft(character.x, character.y - 32));
					case CharacterTypes.ONE_WAY_MOVER_LEFT_LEFT : characters.platforms.add(new OnewayMoverLeftLeft(character.x, character.y - 32));
					case CharacterTypes.ONE_WAY_MOVER_RIGHT_LEFT : characters.platforms.add(new OnewayMoverRightLeft(character.x, character.y - 32));
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