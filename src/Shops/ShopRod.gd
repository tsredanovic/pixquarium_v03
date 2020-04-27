extends Control


# MAIN ENUMS
onready var ROD = get_tree().get_root().get_node("Main").ROD
onready var CURRENCY = get_tree().get_root().get_node("Main").CURRENCY
onready var rods_data = get_tree().get_root().get_node("Main").state["rods"]

func init(current_rod):
	var current_position = Vector2(2, 54)
	var node = Sprite.new()
	for i in range(len(rods_data)):
		# Get rod data
		var rod_data = rods_data[i]
		# Calculate current position
		current_position.y = current_position.y + 34*i
		# Init Sprite
		var rod_sprite = Sprite.new()
		rod_sprite.centered = false
		rod_sprite.position = current_position
		rod_sprite.texture = load(rod_data["texture"])
		add_child(rod_sprite)
		#
		
	print(current_rod)
