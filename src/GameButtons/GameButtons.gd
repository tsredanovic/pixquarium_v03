extends Control


# MAIN ENUMS
onready var ROD = get_tree().get_root().get_node("Main").ROD
onready var rod_textures = {
	ROD.BLACK: "GameButtons/ButtonRodBlack.png",
	ROD.GREEN: "GameButtons/ButtonRodGreen.png"
}

onready var BAIT = get_tree().get_root().get_node("Main").BAIT
onready var bait_textures = {
	BAIT.BLACK: "GameButtons/ButtonBaitBugBlack.png",
	BAIT.GREEN: "GameButtons/ButtonBaitBugGreen.png"
}

onready var LOCATION = get_tree().get_root().get_node("Main").LOCATION
onready var location_textures = {
	LOCATION.POND: "GameButtons/ButtonLocationPond.png",
	LOCATION.HUT: "GameButtons/ButtonLocationHut.png"
}


# BUTTONS
onready var button_menu = $ButtonMenu

onready var menu_buttons = [$ButtonRod, $ButtonBait, $ButtonLocation]
onready var menu_buttons_visibility = null


# INIT
func init(rod, bait, location):
	$ButtonRod.set_normal_texture(load(rod_textures[rod]))
	$ButtonBait.set_normal_texture(load(bait_textures[bait]))
	$ButtonLocation.set_normal_texture(load(location_textures[location]))


# READY
func _ready():
	hide_menu_buttons()


###
func hide_menu_buttons():
	for menu_button in menu_buttons:
		menu_button.visible = false
	menu_buttons_visibility = false

func show_menu_buttons():
	for menu_button in menu_buttons:
		menu_button.visible = true
	menu_buttons_visibility = true

func _on_ButtonMenu_pressed():
	print("Menu button pressed")
	if not menu_buttons_visibility:
		show_menu_buttons()
	else:
		hide_menu_buttons()

func _on_ButtonRod_pressed():
	print("Rod button pressed")


func _on_ButtonBait_pressed():
	print("Bait button pressed")


func _on_ButtonLocation_pressed():
	print("Location button pressed")
