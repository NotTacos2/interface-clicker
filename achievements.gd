extends Control

var config = ConfigFile.new()
var unlocked = false
var rebirth = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.pressed.connect(_goback)
	$Achievement1.visible = false
	$Achievement2.visible = false
	$Achievement5.visible = false
	var save = config.load("user://clicker.cfg")
	if save == OK:
		unlocked = config.get_value("player", "1000achievement")
		rebirth = config.get_value("player", "rebirth")
		
	if unlocked == true:
		$Label.text = "1000 Clicks"
		$Label2.text = "You have clicked 1000 times!"
		$Achievement.visible = false
		$Achievement1.visible = true
		
	if rebirth >= 1:
		$Label4.text = "Rebirthed!"
		$Label3.text = "You have been rebirthed once!"
		$Achievement3.visible = false
		$Achievement2.visible = true
		
	if rebirth == 2:
		$Label5.text = "Rebirthed again!"
		$Label6.text = "You have been rebirthed... again!"
		$Achievement4.visible = false
		$Achievement5.visible = true
	
func _goback():
	get_tree().change_scene_to_file("res://stats.tscn")
