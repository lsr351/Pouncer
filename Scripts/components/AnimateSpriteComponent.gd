class_name CompAnimateSprite
extends Node

@export var sprite : AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
