extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.pressed.connect(_entergame)
	$Button2.pressed.connect(_entersettings)
	$Button3.pressed.connect(_exitgame)
	
func _exitgame():
	get_tree().quit()
	
func _entergame():
	get_tree().change_scene_to_file("res://control.tscn")
	
func _entersettings():
	get_tree().change_scene_to_file("res://settings.tscn")
