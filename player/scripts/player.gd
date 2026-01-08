extends CharacterBody2D
class_name Player

#region /// export variables
@export var move_speed : float = 150.0
#endregion

#region /// StateMachine variables
var states : Array[PlayerState] = []
var current_state : PlayerState :
	get:
		return states.front()
var previous_state : PlayerState :
	get:
		return states[1]
#endregion

#region /// standard variables
var direction : Vector2 = Vector2.ZERO
var gravity : float = 980
#endregion


func _ready() -> void:
	initialize_states()
	pass

func _unhandled_input(event: InputEvent) -> void:
	change_state(current_state.handle_input(event))

func _process(_delta: float) -> void:
	update_direction()
	change_state(current_state.process(_delta))
	pass


func _physics_process(_delta: float) -> void:
	velocity.y += gravity * _delta
	move_and_slide()
	change_state(current_state.physics_process(_delta))
	pass

func initialize_states() -> void:
	states = []
	for c in $States.get_children():
		if c is PlayerState:
			states.append(c)
			c.player = self
	if states.size() == 0:
		return
	for state in states:
		state._init()
	change_state(current_state)
	current_state.enter()
	
func change_state(new_state : PlayerState) -> void:
	if new_state == null:
		return
	elif new_state == current_state:
		return
	if current_state:
		current_state.exit()
	states.push_front(new_state)
	current_state.enter()	
	states.resize(3) # to prevent the state array to become too long
	$Label.text = current_state.name
	
func update_direction() -> void:
	#var prev_direction : Vector2 = direction
	var x_axis = Input.get_axis("left", "right")
	var y_axis = Input.get_axis("up", "down")
	direction = Vector2(x_axis, y_axis)
	pass
	
	
	
	
	
