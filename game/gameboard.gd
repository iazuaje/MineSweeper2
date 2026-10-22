extends Control

@onready var panel_tiempo: PanelTimer = %PanelTiempo

@onready var playing : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if (event.is_action_released("ui_accept")):
		if (!playing):
			panel_tiempo.start_timer()
		else:
			panel_tiempo.stop_timer()
		playing = !playing

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta : float) -> void:
	pass

func _on_back_arrow_button_up() -> void:
	var tween : Tween = create_tween()
	tween.tween_property(
		$BackArrow, 
		"scale", 
		Vector2(0.8,0.8), 
		0.2
	).from(Vector2(1.0,1.0)).set_trans(Tween.TRANS_QUAD)
	await tween.finished

	tween = create_tween()
	tween.tween_property(
		$BackArrow, 
		"scale", 
		Vector2(1.0,1.0), 
		0.2
	).from(Vector2(0.8,0.8)).set_trans(Tween.TRANS_QUAD)
	await tween.finished
	TransitionManager.change_scene_to_file("uid://dlm56bwsjipag") # main_menu
