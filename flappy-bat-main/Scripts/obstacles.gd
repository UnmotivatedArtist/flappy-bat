extends Node2D

@export var speed: int = 100


func _physics_process(delta: float) -> void:
	### This controlls teh movement of the pillars on screen.
	position.x -= speed * delta


func _on_stalactite_body_entered(_body: Node2D) -> void:
	### This resets the player once they collide with a pillar.
	get_tree().call_deferred("reload_current_scene")


func _on_stalagmite_body_entered(_body: Node2D) -> void:
	### This resets the player once they collide with a pillar.
	get_tree().call_deferred("reload_current_scene")


func _on_score_body_entered(_body: Node2D) -> void:
	### This increases the scroe whenever the player passes betwene the pillars.
	Autoload.score += 1


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	### This deletes the pillars once they move off screen.
	queue_free()
