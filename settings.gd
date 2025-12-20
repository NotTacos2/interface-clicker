extends Control

var config = ConfigFile.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.pressed.connect(_reset)
	$Button2.pressed.connect(_goback)
	
func _goback():
	get_tree().change_scene_to_file("res://control.tscn")
	
func _reset():
	config.set_value("player", "score", 0)
	config.set_value("player", "golditem", 0)
	config.set_value("player", "robot", 0)
	config.set_value("player", "city", 0)
	config.set_value("player", "profit", 0)
	config.save("user://clicker.cfg")
