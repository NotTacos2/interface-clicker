extends Control
var config = ConfigFile.new()
var amount = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.pressed.connect(_buttonpressed)
	$Button2.pressed.connect(_button2pressed)
	$Button3.pressed.connect(_savebuttonpressed)
	$Button4.pressed.connect(_settingsbuttonpressed)
	print("Initalized!") # idk how to spell
	var save = config.load("user://clicker.cfg")
	if save == OK:
		amount = config.get_value("player", "score")
	$Label2.text = "Clicked: " + str(amount);
	
func _buttonpressed():
	amount += 1
	$Label2.text = "Clicked: " + str(amount);
	if amount == 100:
		$Label3.text = "ooo 100"
	if amount == 200:
		$Label3.text = "200 nice"
		
func _button2pressed():
	get_tree().change_scene_to_file("res://shop.tscn")
	
func _savebuttonpressed():
	config.set_value("player", "score", amount)
	config.save("user://clicker.cfg")
	
func _settingsbuttonpressed():
	get_tree().change_scene_to_file("res://settings.tscn")
