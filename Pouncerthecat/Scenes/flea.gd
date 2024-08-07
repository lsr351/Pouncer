extends CharacterBody2D

@onready var flea = $AnimatedSprite2D

func _ready():
	flea.flip_h = true
	flea.play("walk")


