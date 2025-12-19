extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.pressed.connect(_goback)
	
func _goback():
	get_tree().change_scene_to_file("res://control.tscn")
