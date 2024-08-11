extends CharacterBody2D

@onready var flea = $AnimatedSprite2D
@export var speed : float = 50
@export var moving_left : bool = true
@export var starting_position : Vector2
@export var move_spaces : int = 200


func _ready():
	starting_position = position
	flea.flip_h = true
	flea.play("walk")


func _physics_process(delta):
	check_wall()
	if moving_left == true:
		flea.flip_h = true
		position.x -= speed * delta
		if position.x <= starting_position.x - move_spaces:
			moving_left = false
	elif moving_left == false:
		flea.flip_h = false
		position.x += speed * delta
		if position.x >= starting_position.x:
			moving_left = true
	move_and_slide()

func check_wall():
	if is_on_wall():
		if moving_left == true:
			moving_left = false
		else:
			moving_left = true
	
