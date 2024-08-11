extends Node2D

# NOTE: The mouse key is the key to leaving the level
var has_mouse_toy = false

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		change_level()

# TODO: Add these to a dictionary
func change_level():
	var current_scene = get_parent().name
	await get_tree().create_timer(0.5).timeout
	if has_mouse_toy == true:
		if current_scene == "LevelOne":
			get_tree().change_scene_to_file("res://Scenes/Levels/level_two.tscn")
		elif current_scene == "LevelTwo":
			get_tree().change_scene_to_file("res://Scenes/Levels/level_three.tscn")
		elif current_scene == "LevelThree":
			get_tree().change_scene_to_file("res://Scenes/Levels/level_four.tscn")
		elif current_scene == "LevelFour":
			get_tree().change_scene_to_file("res://Scenes/Levels/level_five.tscn")
		elif current_scene == "LevelFive":
			print("YOU WIN")
		has_mouse_toy = false
	else:
		# TODO: Fix the label its pretty Janky
		$Label.visible = !$Label.visible
