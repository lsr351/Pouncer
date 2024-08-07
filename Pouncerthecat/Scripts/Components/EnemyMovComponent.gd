class_name EnemyMovementComponent

extends Node

@export var character : CharacterBody2D
@export var speed : float = 50
@export var moving_left : bool = true
@export var starting_position : Vector2 



# Called when the node enters the scene tree for the first time.
func _ready():
	starting_position = character.get_position_delta()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving_left == true:
		character.position.x -= speed * delta
		if character.position.x <= starting_position.x - 200:
			moving_left = false
	elif moving_left == false:
		character.position.x += speed * delta
		if character.position.x >= starting_position.x:
			moving_left = true
	
