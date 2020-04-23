extends Panel

enum FISH {
	LITTLE_RED = 1,
	LITTLE_ = 2
}

enum RARITY {
	COMMON = 1,
	UNCOMMON = 2,
	RARE = 3,
	EPIC = 4,
	LEGENDARY = 5
}

onready var fish_data = [
	{
		"id": FISH.LITTLE_RED,
		"name": "Little red fish",
		"rarity": RARITY.COMMON
	}
]
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
