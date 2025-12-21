extends Control

var config = ConfigFile.new()
var unlocked = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.pressed.connect(_goback)
	$Achievement1.visible = false
	var save = config.load("user://clicker.cfg")
	if save == OK:
		unlocked = config.get_value("player", "1000achievement")
		
	if unlocked == true:
		$Label.text = "1000 Clicks"
		$Label2.text = "You have clicked 1000 times!"
		$Achievement.visible = false
		$Achievement1.visible = true
	
func _goback():
	get_tree().change_scene_to_file("res://stats.tscn")
