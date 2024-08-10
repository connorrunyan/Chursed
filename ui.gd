extends Control

signal change_camera(i)

@export var font: Font
@export var fontBold: Font

@onready var menu_label = $HBoxContainer/MenuContainer/MenuLabel

@onready var options_container = $HBoxContainer/OptionsContainer
@onready var movement_label = $HBoxContainer/OptionsContainer/MovementLabel
@onready var camera_label = $HBoxContainer/OptionsContainer/CameraLabel

@onready var letter_1_container = $HBoxContainer/Letter1Container
@onready var letter_1_a = $HBoxContainer/Letter1Container/Letter1A
@onready var letter_1_b = $HBoxContainer/Letter1Container/Letter1B
@onready var letter_1_c = $HBoxContainer/Letter1Container/Letter1C
@onready var letter_1_d = $HBoxContainer/Letter1Container/Letter1D
@onready var letter_1_e = $HBoxContainer/Letter1Container/Letter1E
@onready var letter_1_f = $HBoxContainer/Letter1Container/Letter1F
@onready var letter_1_g = $HBoxContainer/Letter1Container/Letter1G
@onready var letter_1_h = $HBoxContainer/Letter1Container/Letter1H



var current_col = 0
var current_row = 0
var current_camera = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if current_col == 0:
			select_menu()
		elif current_col == 1:
			if current_row == 0:
				select_movement()
			elif current_row == 1:
				select_cam()
		elif current_col == 2:
			pass
		elif current_col == 3:
			pass
		elif current_col == 4:
			pass
		elif current_col == 5:
			pass
	elif Input.is_action_just_pressed("ui_cancel"):
		if current_col == 0:
			pass
		elif current_col == 1:
			deselect_col_1()
		elif current_col == 2:
			deselect_letters_1()
		elif current_col == 3:
			pass
		elif current_col == 4:
			pass
		elif current_col == 5:
			pass
	elif Input.is_action_just_pressed("ui_up"):
		if current_col == 0:
			pass
		elif current_col == 1:
			current_row += 1
			if current_row > 1:
				current_row = 0
			update_col_1(current_row, current_camera)
		elif current_col == 2:
			current_row += 1
			if current_row > 7:
				current_row = 0
			update_col_2(current_row)
		elif current_col == 3:
			pass
		elif current_col == 4:
			pass
		elif current_col == 5:
			pass
	elif Input.is_action_just_pressed("ui_down"):
		if current_col == 0:
			pass
		elif current_col == 1:
			current_row -= 1
			if current_row < 0:
				current_row = 1
			update_col_1(current_row, current_camera)
		elif current_col == 2:
			current_row -= 1
			if current_row < 0:
				current_row = 7
			update_col_2(current_row)
		elif current_col == 3:
			pass
		elif current_col == 4:
			pass
		elif current_col == 5:
			pass

func select_menu():
	current_col = 1
	current_row = 0
	menu_label.add_theme_font_override("font", fontBold)
	menu_label.text = " MENU"
	options_container.visible = true

func deselect_col_1():
	current_col = 0
	current_row = 0
	update_col_1(current_row, current_camera)
	menu_label.add_theme_font_override("font", font)
	menu_label.text = ">MENU"
	options_container.visible = false

func update_col_1(i, j):
	if i == 0:
		camera_label.text = " CAM " + str(j)
		movement_label.text = ">MOVMT"
	elif i == 1:
		camera_label.text = ">CAM " + str(j)
		movement_label.text = " MOVMT"

func update_col_2(i):
	if i == 0:
		letter_1_a.text = " A"
		letter_1_b.text = " B"
		letter_1_c.text = " C"
		letter_1_d.text = " D"
		letter_1_e.text = " E"
		letter_1_f.text = " F"
		letter_1_g.text = " G"
		letter_1_h.text = ">H"
	elif i == 1:
		letter_1_a.text = " A"
		letter_1_b.text = " B"
		letter_1_c.text = " C"
		letter_1_d.text = " D"
		letter_1_e.text = " E"
		letter_1_f.text = " F"
		letter_1_g.text = ">G"
		letter_1_h.text = " H"
	elif i == 2:
		letter_1_a.text = " A"
		letter_1_b.text = " B"
		letter_1_c.text = " C"
		letter_1_d.text = " D"
		letter_1_e.text = " E"
		letter_1_f.text = ">F"
		letter_1_g.text = " G"
		letter_1_h.text = " H"
	elif i == 3:
		letter_1_a.text = " A"
		letter_1_b.text = " B"
		letter_1_c.text = " C"
		letter_1_d.text = " D"
		letter_1_e.text = ">E"
		letter_1_f.text = " F"
		letter_1_g.text = " G"
		letter_1_h.text = " H"
	elif i == 4:
		letter_1_a.text = " A"
		letter_1_b.text = " B"
		letter_1_c.text = " C"
		letter_1_d.text = ">D"
		letter_1_e.text = " E"
		letter_1_f.text = " F"
		letter_1_g.text = " G"
		letter_1_h.text = " H"
	elif i == 5:
		letter_1_a.text = " A"
		letter_1_b.text = " B"
		letter_1_c.text = ">C"
		letter_1_d.text = " D"
		letter_1_e.text = " E"
		letter_1_f.text = " F"
		letter_1_g.text = " G"
		letter_1_h.text = " H"
	elif i == 6:
		letter_1_a.text = " A"
		letter_1_b.text = ">B"
		letter_1_c.text = " C"
		letter_1_d.text = " D"
		letter_1_e.text = " E"
		letter_1_f.text = " F"
		letter_1_g.text = " G"
		letter_1_h.text = " H"
	elif i == 7:
		letter_1_a.text = ">A"
		letter_1_b.text = " B"
		letter_1_c.text = " C"
		letter_1_d.text = " D"
		letter_1_e.text = " E"
		letter_1_f.text = " F"
		letter_1_g.text = " G"
		letter_1_h.text = " H"

func select_cam():
	current_camera += 1
	if current_camera > 4:
		current_camera = 1
	update_col_1(current_row, current_camera)
	emit_signal("change_camera", current_camera)
	camera_label.add_theme_font_override("font", fontBold)
	$HBoxContainer/OptionsContainer/CameraLabel/Timer.start()

func select_movement():
	current_col = 2
	current_row = 0
	movement_label.text = " MOVMT"
	movement_label.add_theme_font_override("font", fontBold)
	letter_1_container.visible = true

func deselect_letters_1():
	update_col_2(0)
	current_col = 1
	current_row = 0
	update_col_1(current_row, current_camera)
	camera_label.add_theme_font_override("font", font)
	movement_label.add_theme_font_override("font", font)
	letter_1_container.visible = false

func _on_timer_timeout():
	camera_label.add_theme_font_override("font", font)
	deselect_col_1()
