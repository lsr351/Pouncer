extends Node2D

# NOTE: Custom signal to send when we are in the box so enemies cant see us 
signal inside_box

@onready var animated_sprite = $AnimatedSprite2D

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		inside_box.emit()
		await get_tree().create_timer(0.5).timeout
		animated_sprite.play()

func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		animated_sprite.stop()
