extends Sprite

enum DIRECTIONS {
	RIGHT = 1,
	LEFT = 2
}
var PATH_LENGTH = 97

onready var speed = 30
onready var acceleration = 2.5
onready var direction = DIRECTIONS.RIGHT
onready var start_position = self.position.x
onready var end_position = start_position + PATH_LENGTH



func _process(delta):
	if self.position.x >= end_position:
		self.position.x = end_position
		direction = DIRECTIONS.LEFT
	elif self.position.x <= start_position:
		self.position.x = start_position
		direction = DIRECTIONS.RIGHT

	var move_by = speed * delta
	var extra_movement = (self.position.x / PATH_LENGTH) * acceleration
	move_by += extra_movement
	if direction == DIRECTIONS.RIGHT:
		self.position.x += move_by
	else:
		self.position.x -= move_by
