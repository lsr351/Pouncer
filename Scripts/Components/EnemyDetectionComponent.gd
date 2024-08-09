
#TODO: learn me some raycast... STILL NEEDS WORK

class_name CompEnemyDetect
extends Node

@export var raycast : RayCast2D
@export var detection_range: float = 100.0
@export var field_of_view: float = 45.0 # degrees

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(raycast.get_collider())
