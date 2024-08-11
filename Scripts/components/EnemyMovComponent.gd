class_name EnemyMovementComponent

extends Node

@export var character : CharacterBody2D
@export var speed : float = 50
@export var moving_left : bool = true
@export var starting_position : Vector2
@export var move_spaces : int = 200 # How many spaces to move


# Called when the node enters the scene tree for the first time.
func _ready():
	starting_position = character.get_position_delta()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving_left == true:
		character.position.x -= speed * delta
		if character.position.x <= starting_position.x - move_spaces:
			moving_left = false
	elif moving_left == false:
		character.position.x += speed * delta
		if character.position.x >= starting_position.x:
			moving_left = true
	
	# TODO:BUG:Doesn't work on boxes... and only for when moving left
	if character.is_on_wall() && moving_left:
		moving_left = !moving_left
			
	
