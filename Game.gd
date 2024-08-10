extends Node3D

@onready var timer = $AudioStreamPlayer3/Timer

@onready var camera1 = $Camera3D1
@onready var camera2 = $Camera3D2
@onready var camera3 = $Camera3D3
@onready var camera4 = $Camera3D4

@onready var CRT = $CRT
@onready var cam_label = $CamLabel

var current_camera = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = randi_range(1, 20)
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if Input.is_action_just_pressed("ui_accept"):
		current_camera += 1
		if current_camera >= 5:
			current_camera = 1
		change_current_camera(current_camera)
		cam_label.text = str(current_camera)

func change_current_camera(i):
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
