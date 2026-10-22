extends CanvasLayer

func change_scene_to_file(path : String) -> void:
	var tween : Tween = create_tween()
	tween.tween_property(
		%Background.material, 
		"shader_parameter/progress", 
		1.0, 
		1
	).from(0.0).set_trans(Tween.TRANS_SINE)
	
	await tween.finished
	get_tree().change_scene_to_file(path)
	
	tween = create_tween()
	tween.tween_property(
		%Background.material, 
		"shader_parameter/progress", 
		0, 
		1
	).from(1.0).set_trans(Tween.TRANS_SINE)
	await tween.finished
