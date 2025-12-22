extends Control

var config = ConfigFile.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.pressed.connect(_reset)
	$Button2.pressed.connect(_goback)
	
func _goback():
	get_tree().change_scene_to_file("res://mainmenu.tscn")
	
func _reset():
	config.set_value("player", "score", 0)
	config.set_value("player", "golditem", 0)
	config.set_value("player", "robot", 0)
	config.set_value("player", "city", 0)
	config.set_value("player", "profit", 0)
	config.set_value("player", "totalscore", 0)
	config.set_value("player", "totalspent", 0)
	config.set_value("player", "clicked", 0)
	config.set_value("player", "profittotal", 0)
	config.set_value("player", "profitloss", 0)
	config.set_value("player", "1000achievement", false)
	config.set_value("player", "onetime", false)
	config.save("user://clicker.cfg")
	get_tree().change_scene_to_file("res://mainmenu.tscn")
