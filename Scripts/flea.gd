extends CharacterBody2D

@onready var flea = $AnimatedSprite2D
#var speed = 150
#var is_moving_right = false

func _ready():
	flea.flip_h = true
	flea.play("walk")
	
func _process(delta):
	if $EnemyMovementComponent.moving_left == true:
		flea.flip_h = true
	elif $EnemyMovementComponent.moving_left == false:
		flea.flip_h = false
	
func _physics_process(delta):
	move_and_slide()


