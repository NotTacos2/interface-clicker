extends Control

var newplayer = true
var config = ConfigFile.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.pressed.connect(_entergame)
	$Button2.pressed.connect(_entersettings)
	$Button3.pressed.connect(_exitgame)
	
	var save = config.load("user://clicker.cfg")
	if save == OK:
		if !config.has_section("player") || !config.has_section_key("player", "newplayer"):
			config.set_value("player", "newplayer", true)
		newplayer = config.get_value("player", "newplayer")
		
	if newplayer == true: #just in case if these saves are null
		config.set_value("player", "score", 0)
		config.set_value("player", "newplayer", false)
		config.set_value("player", "golditem", 0)
		config.set_value("player", "robot", 0)
		config.set_value("player", "city", 0)
		config.set_value("player", "profit", 0)
		config.set_value("player", "totalscore", 0)
		config.set_value("player", "totalspent", 0)
		config.set_value("player", "rebirth", 0)
		config.set_value("player", "sold", 0)
		config.set_value("player", "stock", 0)
		config.set_value("player", "clicked", 0)
		config.set_value("player", "profittotal", 0)
		config.set_value("player", "profitloss", 0)
		config.set_value("player", "1000achievement", false)
		config.set_value("player", "onetime", false)
		config.save("user://clicker.cfg")
	
func _exitgame():
	get_tree().quit()
	
func _entergame():
	get_tree().change_scene_to_file("res://control.tscn")
	
func _entersettings():
	get_tree().change_scene_to_file("res://settings.tscn")
