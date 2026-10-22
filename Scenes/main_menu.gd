extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta : float) -> void:
	pass

func _on_nuevo_juego_pressed() -> void:
	TransitionManager.change_scene_to_file("res://Scenes/Gameboard.tscn")

func _on_continuar_pressed() -> void:
	pass # Replace with function body.

func _on_nuevo_juego_button_up() -> void:
	pass # Replace with function body.

func _on_continuar_button_up() -> void:
	pass # Replace with function body.
