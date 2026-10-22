extends Node2D

@onready var rope : Rope = $Rope

@export var amplitud : Vector2 = Vector2(10.0,5)
@export var frecuencia : Vector2 = Vector2(1.0,1.0)  # Velocidad de oscilación

var initial_position : Vector2

func _ready() -> void:
	initial_position = rope.position

func _process(_delta : float) -> void:
	var offset : Vector2 = Vector2(sin(Time.get_ticks_msec() / 1000.0 * frecuencia.x) * amplitud.x, 
	cos(Time.get_ticks_msec() / 1000.0 * frecuencia.y) * amplitud.y)
	rope.position = Vector2(initial_position.x + offset.x, initial_position.y + offset.y)
