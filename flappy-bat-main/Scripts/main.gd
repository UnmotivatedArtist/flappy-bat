extends Node2D

@onready var o: PackedScene = preload("res://Scenes/obstacles.tscn")
var vp_width = 320

func _ready() -> void:
	### This sets the initial score to zero
	Autoload.score = 0
	
func _process(_delta: float) -> void:
	### This loads the score and presents it.
	$CanvasLayer/Control/Label.text = str(Autoload.score)


func _on_timer_timeout() -> void:
	### These are the variables that controll the pipes 
	var oi = o.instantiate()
	var modifiers = [-0.3,-0.2,-0.1,0,0.1,0.2,0.3]
	var st_scale = randf_range(1.2,2.8)
	var sm_scale = 4 - st_scale + modifiers.pick_random()
	oi.position.x = vp_width
	
	### This code looks to see if there are any pipes on the screen or not.
	if oi.get_child_count() > 0:
		oi.get_child(0).scale = Vector2(st_scale,st_scale)
		oi.get_child(0).get_child(0).frame = randi_range(0,3)
		
	### This code watches the pipes that are on the screen 
	if oi.get_child_count() > 1:
		oi.get_child(1).scale = Vector2(sm_scale,sm_scale)
		oi.get_child(1).get_child(0).frame = randi_range(0,3)
	
	add_child(oi)
	$Timer.start()
