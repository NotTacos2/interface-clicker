extends Control

var config = ConfigFile.new()
var city = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button2.pressed.connect(_goback)
	$city.visible = false
	var save = config.load("user://clicker.cfg")
	if save == OK:
		city = config.get_value("player", "city")
	if city == 1:
		$Label.visible = false
		$city.visible = true
	
func _goback():
	get_tree().change_scene_to_file("res://control.tscn")
