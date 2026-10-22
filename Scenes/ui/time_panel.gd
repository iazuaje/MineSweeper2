extends PanelContainer
class_name PanelTimer

var _start_time : int = 0
var _paused_elapsed : int = 0  # Tiempo acumulado cuando se pausa
var _current_time : int = 0
var _last_displayed_time : String = ""

@onready var tiempo := %Tiempo

func _ready() -> void:
	set_process(false)
	_start_time = Time.get_ticks_msec()

func _process(_delta : float) -> void:
	_current_time = Time.get_ticks_msec()
	var elapsed_mseconds : int = (_current_time - _start_time) + _paused_elapsed
	@warning_ignore("integer_division")
	var elapsed_seconds : int = elapsed_mseconds / 1000
	
	@warning_ignore("integer_division")
	var hours : int = int(elapsed_seconds / 3600)
	@warning_ignore("integer_division")
	var minutes : int = int((elapsed_seconds % 3600) / 60)
	var seconds : int = int(elapsed_seconds % 60)
	var miliseconds : int = int(elapsed_mseconds % 1000)

	var time_string : String

	if (hours > 99):
		hours = 99  # Limitar a dos dígitos para evitar desbordes visuales
	if (hours == 0):
		time_string = "%02d:%02d:%03d" % [minutes, seconds, miliseconds]
	else:
		time_string = "%02d:%02d:%02d:%03d" % [hours, minutes, seconds, miliseconds]
	
	if time_string != _last_displayed_time:
		tiempo.text = time_string
		_last_displayed_time = time_string

func reset_timer() -> void:
	_start_time = Time.get_ticks_msec()
	_paused_elapsed = 0
	_current_time = _start_time
	_last_displayed_time = ""
	tiempo.text = "00:00:00:000"

func stop_timer() -> void:
	# Guardar el tiempo transcurrido hasta este momento
	_paused_elapsed += Time.get_ticks_msec() - _start_time
	print("stopping")
	set_process(false)

func start_timer() -> void:
	# Reiniciar el contador desde ahora
	_start_time = Time.get_ticks_msec()
	print("starting")
	set_process(true)
