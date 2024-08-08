extends CharacterBody2D


@onready var pouncer = $AnimatedSprite2D
@export var jump_strength = 100
var speed = 200

func _process(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if input_direction:
		pouncer.play("run")
	else:
		pouncer.play("idle")

	if input_direction == Vector2(1, 0):
		pouncer.flip_h = false
	elif input_direction == Vector2(-1, 0):
		pouncer.flip_h = true
	
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			velocity.y -= jump_strength * speed * delta
	elif !is_on_floor():
		pouncer.play("jump")
		
	velocity.x = input_direction.x * speed
	
func _physics_process(delta):
	move_and_slide()
