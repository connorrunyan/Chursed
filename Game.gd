extends Node3D

@onready var timer = $AudioStreamPlayer3/Timer

@onready var camera1 = $Camera3D1
@onready var camera2 = $Camera3D2
@onready var camera3 = $Camera3D3
@onready var camera4 = $Camera3D4

@onready var CRT = $CRT
@onready var vhs_audio = $AudioStreamPlayer5

var current_camera = 1
var current_selection = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = randi_range(1, 20)
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_ui(i):
	if i == 1:
		$ControlLabel.text = "> MVT\n  CAM"
	elif i == 2:
		$ControlLabel.text = "  MVT\n> CAM"

func change_current_camera(i):
	vhs_audio.play()
	if i == 1:
		camera1.current = true
		camera2.current = false
		camera3.current = false
		camera4.current = false
		$Label.visible = true
	elif i == 2:
		camera1.current = false
		camera2.current = true
		camera3.current = false
		camera4.current = false
		$Label.visible = false
	elif i == 3:
		camera1.current = false
		camera2.current = false
		camera3.current = true
		camera4.current = false
		$Label.visible = false
	elif i == 4:
		camera1.current = false
		camera2.current = false
		camera3.current = false
		camera4.current = true
		$Label.visible = false
	
	CRT.animate_switch()


func _on_timer_timeout():
	$AudioStreamPlayer3.play()


func _on_ui_change_camera(i):
	change_current_camera(i)
