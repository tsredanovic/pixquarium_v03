extends CanvasLayer

enum LOCATION {
	POND = 1,
	HUT = 2
}
var location_textures = {
	LOCATION.POND: "GameLocation/LocationPond.png",
	LOCATION.HUT: "GameLocation/LocationHut.png"
}

func init(location):
	$Sprite.set_texture(load(location_textures[location]))
