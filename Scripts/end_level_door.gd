extends Node2D

signal level_transition

func _ready():
	print(get_parent().name)

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("level_transition")
		change_level("res://Scenes/Levels/the_beginning.tscn")
		#print(body.get_groups())

# TODO: Finish the levels
func change_level(scene_path: String):
	var current_scene = get_parent().name
	if current_scene == "LevelOne":
		get_tree().change_scene_to_file("res://Scenes/Levels/level_two.tscn")
	elif current_scene == "LevelTwo":
		print("Need to make level three")
