class_name Player
extends CharacterBody2D


@onready var pouncer = $AnimatedSprite2D
@export var jump_strength = 100
@export var speed = 175
@onready var coyote_timer: Timer = $CoyoteTimer

var was_on_floor := false

func _physics_process(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if input_direction: # Plays the run animation and idle
		pouncer.play("run")
	else:
		pouncer.play("idle")
		

	if input_direction == Vector2(1, 0):
		pouncer.flip_h = false
	elif input_direction == Vector2(-1, 0):
		pouncer.flip_h = true
	
	if Input.is_action_just_pressed("jump"):
		if is_on_floor() or not coyote_timer.is_stopped():
			velocity.y = -jump_strength * speed * delta
	if !is_on_floor():
		pouncer.play("jump")
	
	velocity.x = input_direction.x * speed
	was_on_floor = is_on_floor()
	move_and_slide()
	
	if not is_on_floor() and was_on_floor:
		coyote_timer.start()


# Currently the flee kills us
func _on_hit_area_body_entered(body):
	if body.is_in_group("enemy"):
		queue_free()

