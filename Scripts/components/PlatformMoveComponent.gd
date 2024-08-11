class_name CompPlatformMove

extends Node

@export var platform : CharacterBody2D
@export var speed : float = 50

@export var moving_left : bool = true

@export var starting_position : Vector2
@export var move_spaces : int = 200 # How many spaces to move


# Called when the node enters the scene tree for the first time.
func _ready():
	starting_position = platform.get_position_delta()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving_left == true:
		platform.position.x -= speed * delta
		if platform.position.x <= starting_position.x - move_spaces:
			moving_left = false
	elif moving_left == false:
		platform.position.x += speed * delta
		if platform.position.x >= starting_position.x:
			moving_left = true

