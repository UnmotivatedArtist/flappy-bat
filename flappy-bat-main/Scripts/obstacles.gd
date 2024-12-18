extends Node2D

@export var speed: int = 100


func _physics_process(delta: float) -> void:
	### ADD COMMENT ABOUT WHAT THIS CODE DOES
	position.x -= speed * delta


func _on_stalactite_body_entered(_body: Node2D) -> void:
	### ADD COMMENT ABOUT WHAT THIS CODE DOES
	get_tree().call_deferred("reload_current_scene")


func _on_stalagmite_body_entered(_body: Node2D) -> void:
	### ADD COMMENT ABOUT WHAT THIS CODE DOES
	get_tree().call_deferred("reload_current_scene")


func _on_score_body_entered(_body: Node2D) -> void:
	### ADD COMMENT ABOUT WHAT THIS CODE DOES
	Autoload.score += 1


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	### ADD COMMENT ABOUT WHAT THIS CODE DOES
	queue_free()
