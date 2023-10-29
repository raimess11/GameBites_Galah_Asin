extends CharacterBody2D
class_name Player

@export var camera: Camera2D
@export var speed = 400
@onready var finite_state_machine = $FiniteStateMachine as FiniteStateMachine
@onready var player_normal_state = $FiniteStateMachine/PlayerNormalState as PlayerNormalState
@onready var player_taunt_state = $FiniteStateMachine/PlayerTauntState as PlayerTauntState
@onready var player_run_state = $FiniteStateMachine/PlayerRunState as PlayerRunState

var target = position
var run = false
var collision
var input_direction = Vector2.ZERO

func _ready():
	player_normal_state.player_taunt.connect(finite_state_machine.change_state.bind(player_taunt_state))
	player_taunt_state.player_run.connect(finite_state_machine.change_state.bind(player_run_state))
	player_run_state.player_normal.connect(finite_state_machine.change_state.bind(player_normal_state))

