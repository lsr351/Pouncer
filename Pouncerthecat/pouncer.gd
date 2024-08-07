extends CharacterBody2D

@onready var pouncer = $AnimatedSprite2D

var speed = 200

func _ready():
	var screen_size = get_viewport_rect().size

func _process(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if input_direction > Vector2.ZERO or input_direction < Vector2.ZERO:
		pouncer.play("run")
	else:
		pouncer.stop()
	if input_direction == Vector2(1, 0):
		pouncer.flip_h = false
	elif input_direction == Vector2(-1, 0):
		pouncer.flip_h = true
		
	velocity = input_direction * speed

func _physics_process(delta):
	move_and_slide()
