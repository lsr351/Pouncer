class_name CompPlayerHideSignal
extends Node

#@export var character : CharacterBody2D
@export var area : Area2D
@export var collision : CollisionShape2D

signal hide_player(message)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
