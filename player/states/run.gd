class_name PlayerStateRun extends PlayerState



func _init() -> void:
	pass

# what happebs when we enter the state
func enter() -> void:
	#play animation
	pass

# what happebs when we exit the state
func exit() -> void:
	pass
	
func handle_input( _event : InputEvent) -> PlayerState:
	return next_state

func process( _delta : float) -> PlayerState:
	if player.direction.x == 0:
		return idle
	return next_state

func physics_process( _delta : float) -> PlayerState:
	player.velocity.x = player.direction.x * player.move_speed
	return next_state
