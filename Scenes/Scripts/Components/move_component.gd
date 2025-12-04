extends Node

var time_passed = 0.0
var initial_position: Vector2
@onready var parent = self.get_parent()
@export var amplitude: Vector2 = Vector2(10,10)  # Amplitud del movimiento
@export var frequency: Vector2 = Vector2(1.0, 1.0)   # Velocidad del movimiento (Hz)


func _ready():
	initial_position = parent.position

func _process(delta):
	time_passed += delta
	# Calcula el offset sinusoidal
	var offset_x = amplitude.x * sin(time_passed * frequency.x * TAU)
	var offset_y = amplitude.y * sin(time_passed * frequency.y * TAU)

	parent.position.y = initial_position.y + offset_y
	parent.position.x = initial_position.x + offset_x
