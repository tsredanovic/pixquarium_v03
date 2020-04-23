extends CanvasLayer


# MAIN ENUMS
onready var LOCATION = get_tree().get_root().get_node("Main").LOCATION
onready var location_textures = {
	LOCATION.POND: "GameLocation/LocationPond.png",
	LOCATION.HUT: "GameLocation/LocationHut.png"
}


# INIT
func init(location):
	$Sprite.set_texture(load(location_textures[location]))
