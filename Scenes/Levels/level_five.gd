extends Node2D





func _on_child_exiting_tree(node):
	if node.name == "MouseyToy":
		$EndLevelDoor.has_mouse_toy = true
		print($EndLevelDoor.has_mouse_toy)
	if node.name == "PouncerTwo":
		$GameOverMenu.show()
