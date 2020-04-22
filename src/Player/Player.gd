extends Node2D

# States
enum {
	STATE_IDLE,
	STATE_READY,
	STATE_CAST,
	STATE_FISH,
	STATE_HOOKED
}
var current_state = null

# Animations
onready var player_ap = $AnimationPlayer
onready var player_sprite = $Sprite

# Timers
onready var fish_timer = $FishTimer
var MIN_TIME_FISH_STATE = 3
var MAX_TIME_FISH_STATE = 6
onready var hooked_timer = $HookTimer
var TIME_HOOKED_STATE = 2.5

func _ready():
	state_idle()

func state_idle():
	# Set state
	print('State Idle')
	current_state = STATE_IDLE
	# Handle animation
	player_ap.play("Idle")
	# Stop timers
	fish_timer.stop()
	hooked_timer.stop()

func state_ready():
	# Set state
	print('State Ready')
	current_state = STATE_READY
	# Handle animation
	player_ap.play("Ready")

func state_cast():
	# Set state
	print('State Cast')
	current_state = STATE_CAST
	# Handle animation
	player_ap.play("Cast")

func _on_AnimationPlayer_animation_finished(anim_name):
	# When `Cast` animation ends transition to `STATE_FISH`
	if anim_name == 'Cast':
		state_fish()

func state_fish():
	# Set state
	print('State Fish')
	current_state = STATE_FISH
	# Handle animation
	player_ap.stop()
	player_sprite.frame = 18
	# Start `fish_timer`
	fish_timer.wait_time = rand_range(MIN_TIME_FISH_STATE, MAX_TIME_FISH_STATE)
	fish_timer.start()

func _on_FishTimer_timeout():
	# When `fish_timer` timeouts transition to `STATE_HOOKED`
	state_hooked()

func state_hooked():
	# Set state
	print('State Hooked')
	current_state = STATE_HOOKED
	# Handle animation
	player_ap.play("Hook")
	# Start `hooked_timer`
	hooked_timer.wait_time = TIME_HOOKED_STATE
	hooked_timer.start()

func _on_HookTimer_timeout():
	# When `hoked_timer` timeouts transition to `STATE_FISH`
	state_fish()

func mouse_pressed():
	match current_state:
		STATE_IDLE:
			# When `mouse_pressed` on `STATE_IDLE` transition to `STATE_READY`
			state_ready()
		STATE_READY:
			# When `mouse_pressed` on `STATE_READY` transition to `STATE_CAST`
			state_cast()
		STATE_FISH:
			# When `mouse_pressed` on `STATE_FISH` transition to `STATE_IDLE`
			print('FISH GOT AWAY!')
			state_idle()
		STATE_HOOKED:
			# When `mouse_pressed` on `STATE_HOOKED` transition to `STATE_IDLE`
			print('FISH COUGHT!')
			state_idle()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			mouse_pressed()
