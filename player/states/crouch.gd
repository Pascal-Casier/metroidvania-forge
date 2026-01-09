class_name PlayerStateCrouch extends PlayerState

@export var deceleration_rate : float = 10


func _init() -> void:
	pass

# what happebs when we enter the state
func enter() -> void:
	#play animation
	player.collision_stand.disabled = true
	player.collision_crouch.disabled = false
	player.sprite.scale.y = 0.625
	player.sprite.position.y = -15
	pass

# what happebs when we exit the state
func exit() -> void:
	player.collision_stand.disabled = false
	player.collision_crouch.disabled = true
	player.sprite.scale.y = 1
	player.sprite.position.y = -24
	pass
	
func handle_input( _event : InputEvent) -> PlayerState:
	if _event.is_action_pressed("jump"):
		if player.one_way_platform_raycast.is_colliding():
			player.position.y += 4
			return fall
		return jump
	return next_state

func process( _delta : float) -> PlayerState:
	if player.direction.y <= 0.5:
		return idle
	return next_state

func physics_process( _delta : float) -> PlayerState:
	player.velocity.x -= player.velocity.x * deceleration_rate * _delta
	if player.is_on_floor() == false:
		return fall
	return next_state
