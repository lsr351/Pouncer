class_name CompItemPickup
extends Node

# TODO: Finish this script...
# NOTE: Gonna want to free the item on pick up and add in to and 
# inventory so we have a key to leave the level
# Mousey toy will have the logic within the script

signal pickup_item

@export var node : Node2D
@export var area : Area2D

var item
# Called when the node enters the scene tree for the first time.
func _ready():
	item = get_parent().name


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if item == "MouseyToy":
		node.queue_free()
