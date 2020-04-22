extends Control


onready var button_menu = $ButtonMenu

onready var menu_buttons = [$ButtonRod, $ButtonBait, $ButtonLocation]
var menu_buttons_visibility = null

enum ROD {
	BLACK = 1,
	GREEN = 2
}
var rod_textures = {
	ROD.BLACK: "GameButtons/ButtonRodBlack.png",
	ROD.GREEN: "GameButtons/ButtonRodGreen.png"
}

enum BAIT {
	BLACK = 1,
	GREEN = 2
}
var bait_textures = {
	BAIT.BLACK: "GameButtons/ButtonBaitBugBlack.png",
	BAIT.GREEN: "GameButtons/ButtonBaitBugGreen.png"
}

enum LOCATION {
	POND = 1,
	HUT = 2
}
var location_textures = {
	LOCATION.POND: "GameButtons/ButtonLocationPond.png",
	LOCATION.HUT: "GameButtons/ButtonLocationHut.png"
}

func hide_menu_buttons():
	for menu_button in menu_buttons:
		menu_button.visible = false
	menu_buttons_visibility = false

func show_menu_buttons():
	for menu_button in menu_buttons:
		menu_button.visible = true
	menu_buttons_visibility = true

func _ready():
	hide_menu_buttons()

func init(rod, bait, location):
	$ButtonRod.set_normal_texture(load(rod_textures[rod]))
	$ButtonBait.set_normal_texture(load(bait_textures[bait]))
	$ButtonLocation.set_normal_texture(load(location_textures[location]))

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
