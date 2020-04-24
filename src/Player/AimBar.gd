extends Sprite
"""
enum POINTER_DIRECTIONS {
	RIGHT = 1,
	LEFT = 2
}
var PATH_LENGTH = 97

onready var pointer_speed = 30
onready var pointer_acceleration = 2.5
onready var pointer_direction = POINTER_DIRECTIONS.RIGHT
onready var pointer_start_position = $AimBarPointer.position.x
onready var pointer_end_position = pointer_start_position + PATH_LENGTH



func _process(delta):
	if $AimBarPointer.position.x >= pointer_end_position:
		$AimBarPointer.position.x = pointer_end_position
		pointer_direction = POINTER_DIRECTIONS.LEFT
	elif $AimBarPointer.position.x <= pointer_start_position:
		$AimBarPointer.position.x = pointer_start_position
		pointer_direction = POINTER_DIRECTIONS.RIGHT

	var move_by = pointer_speed * delta
	var extra_movement = ($AimBarPointer.position.x / PATH_LENGTH) * pointer_acceleration
	move_by += extra_movement
	if pointer_direction == POINTER_DIRECTIONS.RIGHT:
		$AimBarPointer.position.x += move_by
	else:
		$AimBarPointer.position.x -= move_by

"""
