extends Control


func _on_start_button_pressed():
	start_game()


func start_game():
	get_tree().change_scene_to_file("res://Scenes/Levels/level_one.tscn")
