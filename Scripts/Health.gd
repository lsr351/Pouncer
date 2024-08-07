class_name CharacterHealth

extends Node2D

@export var character : CharacterBody2D
@export var health_points: int = 1
@export var opponent_groups: Array[String] = ["enemy","hazard"]
@export var damage_cooldown: float = 1.0

@onready var progress_bar = $ProgressBar
@onready var damage_cooldown_timer = $DamageCooldownTimer

# This is the function to call on the hit detection signal has to be a signal
# from an Area2D watching for other bodies entering it.
func _on_area_2d_body_entered(body):
	# If what hit us is something that can hurt us, hurt us.
	for group in body.get_groups() and damage_cooldown_timer.is_stopped():
		if opponent_groups.has(group):
			take_damage(1)
	pass # Replace with function body.

func _ready():
	setup_progress_bar()
	damage_cooldown_timer.wait_time = damage_cooldown
	pass # Replace with function body.

func setup_progress_bar():
	progress_bar.max_value = health_points
	progress_bar.value = health_points
	# If we only have one hit point don't bother showing the health bar.
	if health_points == 1:
		progress_bar.visible = false

func take_damage(damage):
	health_points -= damage
	update_progress_bar(health_points)
	damage_cooldown_timer.start()
	print("Ouch! I took damage!")
	# Fire a damage animation here if needed.
	if health_points <= 0:
		death()
	progress_bar.visible = true

func death():
	# If projectiles are fired from the character they probably shouldn't be 
	# freed as well. This will have to be changed to do that depending on where
	# the projectiles exist on the node tree. Might also be good to fire off a 
	# death animation here too.
	character.queue_free()

func update_progress_bar(value):
	progress_bar.value = value

func _on_damage_cooldown_timer_timeout():
	progress_bar.visible = false
	pass # Replace with function body.
