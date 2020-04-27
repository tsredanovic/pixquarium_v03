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

enum CURRENCY {
	COIN = 1,
	PEARL = 2
}

# GAME STATE
onready var state = {
	"rods": [
	{
		"id": ROD.BLACK,
		"texture": "GameButtons/ButtonRodBlack.png",
		"name": "Branch",
		"price": 0,
		"currency": CURRENCY.COIN,
		"owned": true
	},
	{
		"id": ROD.GREEN,
		"texture": "GameButtons/ButtonRodGreen.png",
		"name": "Standard Rod",
		"price": 100,
		"currency": CURRENCY.COIN,
		"owned": false
	}
],
	"rod": ROD.BLACK,
	"bait": BAIT.BLACK,
	"location": LOCATION.HUT
}

# INSTANCE POUCH
func instance_pouch():
	var pouch = preload("res://Pouch/Pouch.tscn").instance()
	add_child(pouch)

# INSTANCE GAME
func instance_game():
	instance_pouch()
	instance_game_buttons()
	instance_game_location()
	instance_player()

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

# INSTANCE A BACK BUTTON
func instance_back_button():
	var back_button = preload("res://Shops/BackButton.tscn").instance()
	back_button.connect("pressed", self, "_on_BackButton_pressed")
	add_child(back_button)

# INSTANCE SHOP ROD
func instance_shop_rod():
	var shop_rod = preload("res://Shops/ShopRod.tscn").instance()
	add_child(shop_rod)
	shop_rod.init(state["rod"])
	instance_pouch()
	instance_back_button()

# KILL ALL CHILDREN
func kill_children():
	for child in get_children():
		child.queue_free()

func _ready():
	instance_game()

func _on_BackButton_pressed():
	print("Back button pressed")
	kill_children()
	instance_game()

func _on_ButtonRod_pressed():
	print("Rod button pressed")
	kill_children()
	instance_shop_rod()


func _on_ButtonBait_pressed():
	print("Bait button pressed")


func _on_ButtonLocation_pressed():
	print("Location button pressed")
