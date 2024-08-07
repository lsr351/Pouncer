class_name CompCharactersGravity

extends Node

@export var character : CharacterBody2D
@export var gravity : float = 980
@export var gravity_speed : float = 0.5

var gravity_vector

func _process(delta):
	if !character.is_on_floor():
		gravity_vector = Vector2(0, gravity * delta * gravity_speed)
		character.velocity += gravity_vector
