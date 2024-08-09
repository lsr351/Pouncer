class_name CompPlatformMove

extends Node

@export var area : Area2D
@export var speed : float = 50
@export var moving_left : bool = true
@export var starting_position : Vector2
@export var move_spaces : int = 200 # How many spaces to move


# Called when the node enters the scene tree for the first time.
func _ready():
	starting_position = area.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving_left == true:
		area.position.x -= speed * delta
		if area.position.x <= starting_position.x - move_spaces:
			moving_left = false
	elif moving_left == false:
		area.position.x += speed * delta
		if area.position.x >= starting_position.x:
			moving_left = true
