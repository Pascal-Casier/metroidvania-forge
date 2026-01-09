@icon( "res://player/states/state.svg" )
class_name PlayerState extends Node

var player : Player
var next_state : PlayerState

#region /// state references
@onready var idle: PlayerStateIdle = %Idle
@onready var run: PlayerStateRun = %Run
@onready var jump: PlayerStateJump = %Jump
@onready var fall: PlayerStateFall = %Fall
@onready var crouch: PlayerStateCrouch = %crouch

#endregion

# what happens when this state initialize 
func _init() -> void:
	pass

# what happebs when we enter the state
func enter() -> void:
	pass

# what happebs when we exit the state
func exit() -> void:
	pass
	
func handle_input( _event : InputEvent) -> PlayerState:
	return next_state

func process( _delta : float) -> PlayerState:
	return next_state

func physics_process( _delta : float) -> PlayerState:
	return next_state
