extends CharacterBody2D

@onready var pouncer = $AnimatedSprite2D
@export var jump_strength = 100
var speed = 200
@export var is_moving : bool = false
@onready var animation_tree : AnimationTree = $AnimationTree


func _ready():
	animation_tree.active = true # NOTE: Could probably just check the box

func _process(delta):
	update_animation_parameters()
	var input_direction = Input.get_vector("left", "right", "up", "down")

	if input_direction == Vector2(1, 0):
		pouncer.flip_h = false
	elif input_direction == Vector2(-1, 0):
		pouncer.flip_h = true
	
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			#pouncer.play("pounce")
			velocity.y -= jump_strength * speed * delta
	velocity.x = input_direction.x * speed

func _physics_process(delta):
	move_and_slide()
	
func update_animation_parameters():
	if(velocity == Vector2.ZERO):
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/moving"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/moving"] = true
		
	if Input.is_action_just_pressed("attack"):
		animation_tree["parameters/conditions/attack"] = true
	else:
		animation_tree["parameters/conditions/attack"] = false
		
