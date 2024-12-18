extends CharacterBody2D

@export var flap_force: int = 300
var gravity: float = 981

func _physics_process(delta: float) -> void:
	### This looks for if an input is made on the keyboard/mouse, and if it sees one, it moves the bat.
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("Flap"):
		velocity.y = -flap_force
	move_and_slide()
	
func _process(_delta: float) -> void:
	### This changes the player animation based on the velocity/what direction it is moving (bc you can use its x,y cords to see if it is moving.
	if velocity.y > 0:
		$AnimationPlayer.play("Down")
	elif velocity.y < 0:
		$AnimationPlayer.play("Up")
	else:
		$Sprite2D.frame = 6


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	### This resets the character once they crash and reloads the start position of the background and the player.
	get_tree().call_deferred("reload_current_scene")
