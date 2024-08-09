extends CharacterBody2D

@onready var flea = $AnimatedSprite2D
@onready var hidebox = $HideBox
var player_in_box : bool = false
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

