extends Node2D

# ENUMS
enum ROD {
	BLACK = 1,
	GREEN = 2
}

enum BAIT {
	BLACK = 1,
	GREEN = 2
}

enum LOCATION {
	POND = 1,
	HUT = 2
}

# GAME STATE
onready var state = {
	"rod": ROD.BLACK,
	"bait": BAIT.GREEN,
	"location": LOCATION.POND
}

func instance_game_buttons():
	var game_buttons = preload("res://GameButtons/GameButtons.tscn").instance()
	add_child(game_buttons)
	game_buttons.init(state["rod"], state["bait"], state["location"])

func instance_game_location():
	var game_location = preload("res://GameLocation/GameLocation.tscn").instance()
	add_child(game_location)
	game_location.init(state["location"])

func instance_player():
	var player = preload("res://Player/Player.tscn").instance()
	add_child(player)

func _ready():
	instance_game_buttons()
	instance_game_location()
	instance_player()
