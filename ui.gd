extends Control

signal change_camera(i)
signal move(a,b,c,d)

@export var font: Font
@export var fontBold: Font

@onready var switch_audio = $SwitchAudio

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

@onready var number_1_container = $HBoxContainer/Number1Container
@onready var number_1_1 = $HBoxContainer/Number1Container/Number11
@onready var number_1_2 = $HBoxContainer/Number1Container/Number12
@onready var number_1_3 = $HBoxContainer/Number1Container/Number13
@onready var number_1_4 = $HBoxContainer/Number1Container/Number14
@onready var number_1_5 = $HBoxContainer/Number1Container/Number15
@onready var number_1_6 = $HBoxContainer/Number1Container/Number16
@onready var number_1_7 = $HBoxContainer/Number1Container/Number17
@onready var number_1_8 = $HBoxContainer/Number1Container/Number18

@onready var letter_2_container = $HBoxContainer/Letter2Container
@onready var letter_2_a = $HBoxContainer/Letter2Container/Letter2A
@onready var letter_2_b = $HBoxContainer/Letter2Container/Letter2B
@onready var letter_2_c = $HBoxContainer/Letter2Container/Letter2C
@onready var letter_2_d = $HBoxContainer/Letter2Container/Letter2D
@onready var letter_2_e = $HBoxContainer/Letter2Container/Letter2E
@onready var letter_2_f = $HBoxContainer/Letter2Container/Letter2F
@onready var letter_2_g = $HBoxContainer/Letter2Container/Letter2G
@onready var letter_2_h = $HBoxContainer/Letter2Container/Letter2H

@onready var number_2_container = $HBoxContainer/Number2Container
@onready var number_2_1 = $HBoxContainer/Number2Container/Number21
@onready var number_2_2 = $HBoxContainer/Number2Container/Number22
@onready var number_2_3 = $HBoxContainer/Number2Container/Number23
@onready var number_2_4 = $HBoxContainer/Number2Container/Number24
@onready var number_2_5 = $HBoxContainer/Number2Container/Number25
@onready var number_2_6 = $HBoxContainer/Number2Container/Number26
@onready var number_2_7 = $HBoxContainer/Number2Container/Number27
@onready var number_2_8 = $HBoxContainer/Number2Container/Number28

var current_col = 0
var current_row = 0
var current_camera = 1

var selected_letter_1 = 0
var selected_number_1 = 0
var selected_letter_2 = 0
var selected_number_2 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if current_col == 0:
			select_menu()
			play_switch_audio()
		elif current_col == 1:
			if current_row == 0:
				select_movement()
				play_switch_audio()
			elif current_row == 1:
				select_cam()
		elif current_col == 2:
			select_letter_1(current_row)
			play_switch_audio()
		elif current_col == 3:
			select_number_1(current_row)
			play_switch_audio()
		elif current_col == 4:
			select_letter_2(current_row)
			play_switch_audio()
		elif current_col == 5:
			select_number_2(current_row)
	elif Input.is_action_just_pressed("ui_cancel"):
		if current_col == 0:
			pass
		elif current_col == 1:
			deselect_options()
			play_switch_audio()
		elif current_col == 2:
			deselect_letters_1()
			play_switch_audio()
		elif current_col == 3:
			deselect_numbers_1()
			play_switch_audio()
		elif current_col == 4:
			deselect_letters_2()
			play_switch_audio()
		elif current_col == 5:
			deselect_numbers_2()
			play_switch_audio()
	elif Input.is_action_just_pressed("ui_up"):
		if current_col == 0:
			pass
		elif current_col == 1:
			current_row += 1
			if current_row > 1:
				current_row = 0
			update_col_1(current_row, current_camera)
			play_switch_audio()
		elif current_col == 2:
			current_row += 1
			if current_row > 7:
				current_row = 0
			update_col_2(current_row)
			play_switch_audio()
		elif current_col == 3:
			current_row += 1
			if current_row > 7:
				current_row = 0
			update_col_3(current_row)
			play_switch_audio()
		elif current_col == 4:
			current_row += 1
			if current_row > 7:
				current_row = 0
			update_col_4(current_row)
			play_switch_audio()
		elif current_col == 5:
			current_row += 1
			if current_row > 7:
				current_row = 0
			update_col_5(current_row)
			play_switch_audio()
	elif Input.is_action_just_pressed("ui_down"):
		if current_col == 0:
			pass
		elif current_col == 1:
			current_row -= 1
			if current_row < 0:
				current_row = 1
			update_col_1(current_row, current_camera)
			play_switch_audio()
		elif current_col == 2:
			current_row -= 1
			if current_row < 0:
				current_row = 7
			update_col_2(current_row)
			play_switch_audio()
		elif current_col == 3:
			current_row -= 1
			if current_row < 0:
				current_row = 7
			update_col_3(current_row)
			play_switch_audio()
		elif current_col == 4:
			current_row -= 1
			if current_row < 0:
				current_row = 7
			update_col_4(current_row)
			play_switch_audio()
		elif current_col == 5:
			current_row -= 1
			if current_row < 0:
				current_row = 7
			update_col_5(current_row)
			play_switch_audio()

func play_switch_audio():
	if switch_audio.playing:
		switch_audio.stop()
	switch_audio.volume_db = randf_range(-15, -10)
	switch_audio.pitch_scale = randf_range(0.97, 1.03)
	switch_audio.play()

func select_menu():
	current_col = 1
	current_row = 0
	menu_label.add_theme_font_override("font", fontBold)
	menu_label.text = " MENU"
	options_container.visible = true

func deselect_options():
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

func update_col_3(i):
	if i == 0:
		number_1_1.text = " 1"
		number_1_2.text = " 2"
		number_1_3.text = " 3"
		number_1_4.text = " 4"
		number_1_5.text = " 5"
		number_1_6.text = " 6"
		number_1_7.text = " 7"
		number_1_8.text = ">8"
	elif i == 1:
		number_1_1.text = " 1"
		number_1_2.text = " 2"
		number_1_3.text = " 3"
		number_1_4.text = " 4"
		number_1_5.text = " 5"
		number_1_6.text = " 6"
		number_1_7.text = ">7"
		number_1_8.text = " 8"
	elif i == 2:
		number_1_1.text = " 1"
		number_1_2.text = " 2"
		number_1_3.text = " 3"
		number_1_4.text = " 4"
		number_1_5.text = " 5"
		number_1_6.text = ">6"
		number_1_7.text = " 7"
		number_1_8.text = " 8"
	elif i == 3:
		number_1_1.text = " 1"
		number_1_2.text = " 2"
		number_1_3.text = " 3"
		number_1_4.text = " 4"
		number_1_5.text = ">5"
		number_1_6.text = " 6"
		number_1_7.text = " 7"
		number_1_8.text = " 8"
	elif i == 4:
		number_1_1.text = " 1"
		number_1_2.text = " 2"
		number_1_3.text = " 3"
		number_1_4.text = ">4"
		number_1_5.text = " 5"
		number_1_6.text = " 6"
		number_1_7.text = " 7"
		number_1_8.text = " 8"
	elif i == 5:
		number_1_1.text = " 1"
		number_1_2.text = " 2"
		number_1_3.text = ">3"
		number_1_4.text = " 4"
		number_1_5.text = " 5"
		number_1_6.text = " 6"
		number_1_7.text = " 7"
		number_1_8.text = " 8"
	elif i == 6:
		number_1_1.text = " 1"
		number_1_2.text = ">2"
		number_1_3.text = " 3"
		number_1_4.text = " 4"
		number_1_5.text = " 5"
		number_1_6.text = " 6"
		number_1_7.text = " 7"
		number_1_8.text = " 8"
	elif i == 7:
		number_1_1.text = ">1"
		number_1_2.text = " 2"
		number_1_3.text = " 3"
		number_1_4.text = " 4"
		number_1_5.text = " 5"
		number_1_6.text = " 6"
		number_1_7.text = " 7"
		number_1_8.text = " 8"

func update_col_4(i):
	if i == 0:
		letter_2_a.text = " A"
		letter_2_b.text = " B"
		letter_2_c.text = " C"
		letter_2_d.text = " D"
		letter_2_e.text = " E"
		letter_2_f.text = " F"
		letter_2_g.text = " G"
		letter_2_h.text = ">H"
	elif i == 1:
		letter_2_a.text = " A"
		letter_2_b.text = " B"
		letter_2_c.text = " C"
		letter_2_d.text = " D"
		letter_2_e.text = " E"
		letter_2_f.text = " F"
		letter_2_g.text = ">G"
		letter_2_h.text = " H"
	elif i == 2:
		letter_2_a.text = " A"
		letter_2_b.text = " B"
		letter_2_c.text = " C"
		letter_2_d.text = " D"
		letter_2_e.text = " E"
		letter_2_f.text = ">F"
		letter_2_g.text = " G"
		letter_2_h.text = " H"
	elif i == 3:
		letter_2_a.text = " A"
		letter_2_b.text = " B"
		letter_2_c.text = " C"
		letter_2_d.text = " D"
		letter_2_e.text = ">E"
		letter_2_f.text = " F"
		letter_2_g.text = " G"
		letter_2_h.text = " H"
	elif i == 4:
		letter_2_a.text = " A"
		letter_2_b.text = " B"
		letter_2_c.text = " C"
		letter_2_d.text = ">D"
		letter_2_e.text = " E"
		letter_2_f.text = " F"
		letter_2_g.text = " G"
		letter_2_h.text = " H"
	elif i == 5:
		letter_2_a.text = " A"
		letter_2_b.text = " B"
		letter_2_c.text = ">C"
		letter_2_d.text = " D"
		letter_2_e.text = " E"
		letter_2_f.text = " F"
		letter_2_g.text = " G"
		letter_2_h.text = " H"
	elif i == 6:
		letter_2_a.text = " A"
		letter_2_b.text = ">B"
		letter_2_c.text = " C"
		letter_2_d.text = " D"
		letter_2_e.text = " E"
		letter_2_f.text = " F"
		letter_2_g.text = " G"
		letter_2_h.text = " H"
	elif i == 7:
		letter_2_a.text = ">A"
		letter_2_b.text = " B"
		letter_2_c.text = " C"
		letter_2_d.text = " D"
		letter_2_e.text = " E"
		letter_2_f.text = " F"
		letter_2_g.text = " G"
		letter_2_h.text = " H"

func update_col_5(i):
	if i == 0:
		number_2_1.text = " 1"
		number_2_2.text = " 2"
		number_2_3.text = " 3"
		number_2_4.text = " 4"
		number_2_5.text = " 5"
		number_2_6.text = " 6"
		number_2_7.text = " 7"
		number_2_8.text = ">8"
	elif i == 1:
		number_2_1.text = " 1"
		number_2_2.text = " 2"
		number_2_3.text = " 3"
		number_2_4.text = " 4"
		number_2_5.text = " 5"
		number_2_6.text = " 6"
		number_2_7.text = ">7"
		number_2_8.text = " 8"
	elif i == 2:
		number_2_1.text = " 1"
		number_2_2.text = " 2"
		number_2_3.text = " 3"
		number_2_4.text = " 4"
		number_2_5.text = " 5"
		number_2_6.text = ">6"
		number_2_7.text = " 7"
		number_2_8.text = " 8"
	elif i == 3:
		number_2_1.text = " 1"
		number_2_2.text = " 2"
		number_2_3.text = " 3"
		number_2_4.text = " 4"
		number_2_5.text = ">5"
		number_2_6.text = " 6"
		number_2_7.text = " 7"
		number_2_8.text = " 8"
	elif i == 4:
		number_2_1.text = " 1"
		number_2_2.text = " 2"
		number_2_3.text = " 3"
		number_2_4.text = ">4"
		number_2_5.text = " 5"
		number_2_6.text = " 6"
		number_2_7.text = " 7"
		number_2_8.text = " 8"
	elif i == 5:
		number_2_1.text = " 1"
		number_2_2.text = " 2"
		number_2_3.text = ">3"
		number_2_4.text = " 4"
		number_2_5.text = " 5"
		number_2_6.text = " 6"
		number_2_7.text = " 7"
		number_2_8.text = " 8"
	elif i == 6:
		number_2_1.text = " 1"
		number_2_2.text = ">2"
		number_2_3.text = " 3"
		number_2_4.text = " 4"
		number_2_5.text = " 5"
		number_2_6.text = " 6"
		number_2_7.text = " 7"
		number_2_8.text = " 8"
	elif i == 7:
		number_2_1.text = ">1"
		number_2_2.text = " 2"
		number_2_3.text = " 3"
		number_2_4.text = " 4"
		number_2_5.text = " 5"
		number_2_6.text = " 6"
		number_2_7.text = " 7"
		number_2_8.text = " 8"

func select_letter_1(i):
	selected_letter_1 = i
	if i == 0:
		letter_1_h.add_theme_font_override("font", fontBold)
		letter_1_h.text = " H"
	elif i == 1:
		letter_1_g.add_theme_font_override("font", fontBold)
		letter_1_g.text = " G"
	elif i == 2:
		letter_1_f.add_theme_font_override("font", fontBold)
		letter_1_f.text = " F"
	elif i == 3:
		letter_1_e.add_theme_font_override("font", fontBold)
		letter_1_e.text = " E"
	elif i == 4:
		letter_1_d.add_theme_font_override("font", fontBold)
		letter_1_d.text = " D"
	elif i == 5:
		letter_1_c.add_theme_font_override("font", fontBold)
		letter_1_c.text = " C"
	elif i == 6:
		letter_1_b.add_theme_font_override("font", fontBold)
		letter_1_b.text = " B"
	elif i == 7:
		letter_1_a.add_theme_font_override("font", fontBold)
		letter_1_a.text = " A"
	number_1_container.visible = true
	current_col = 3
	current_row = 0
	update_col_3(current_row)

func select_number_1(i):
	selected_number_1 = i
	if i == 0:
		number_1_8.add_theme_font_override("font", fontBold)
		number_1_8.text = " 8"
	elif i == 1:
		number_1_7.add_theme_font_override("font", fontBold)
		number_1_7.text = " 7"
	elif i == 2:
		number_1_6.add_theme_font_override("font", fontBold)
		number_1_6.text = " 6"
	elif i == 3:
		number_1_5.add_theme_font_override("font", fontBold)
		number_1_5.text = " 5"
	elif i == 4:
		number_1_4.add_theme_font_override("font", fontBold)
		number_1_4.text = " 4"
	elif i == 5:
		number_1_3.add_theme_font_override("font", fontBold)
		number_1_3.text = " 3"
	elif i == 6:
		number_1_2.add_theme_font_override("font", fontBold)
		number_1_2.text = " 2"
	elif i == 7:
		number_1_1.add_theme_font_override("font", fontBold)
		number_1_1.text = " 1"
	letter_2_container.visible = true
	current_col = 4
	current_row = 0
	update_col_4(current_row)

func select_letter_2(i):
	selected_letter_2 = i
	if i == 0:
		letter_2_h.add_theme_font_override("font", fontBold)
		letter_2_h.text = " H"
	elif i == 1:
		letter_2_g.add_theme_font_override("font", fontBold)
		letter_2_g.text = " G"
	elif i == 2:
		letter_2_f.add_theme_font_override("font", fontBold)
		letter_2_f.text = " F"
	elif i == 3:
		letter_2_e.add_theme_font_override("font", fontBold)
		letter_2_e.text = " E"
	elif i == 4:
		letter_2_d.add_theme_font_override("font", fontBold)
		letter_2_d.text = " D"
	elif i == 5:
		letter_2_c.add_theme_font_override("font", fontBold)
		letter_2_c.text = " C"
	elif i == 6:
		letter_2_b.add_theme_font_override("font", fontBold)
		letter_2_b.text = " B"
	elif i == 7:
		letter_2_a.add_theme_font_override("font", fontBold)
		letter_2_a.text = " A"
	number_2_container.visible = true
	current_col = 5
	current_row = 0
	update_col_5(current_row)

func select_number_2(i):
	selected_number_2 = i
	if i == 0:
		number_2_8.add_theme_font_override("font", fontBold)
		number_2_8.text = " 8"
	elif i == 1:
		number_2_7.add_theme_font_override("font", fontBold)
		number_2_7.text = " 7"
	elif i == 2:
		number_2_6.add_theme_font_override("font", fontBold)
		number_2_6.text = " 6"
	elif i == 3:
		number_2_5.add_theme_font_override("font", fontBold)
		number_2_5.text = " 5"
	elif i == 4:
		number_2_4.add_theme_font_override("font", fontBold)
		number_2_4.text = " 4"
	elif i == 5:
		number_2_3.add_theme_font_override("font", fontBold)
		number_2_3.text = " 3"
	elif i == 6:
		number_2_2.add_theme_font_override("font", fontBold)
		number_2_2.text = " 2"
	elif i == 7:
		number_2_1.add_theme_font_override("font", fontBold)
		number_2_1.text = " 1"
	current_col = 6
	current_row = 0
	$HBoxContainer/Number2Container/MoveEnteredTimer.start()
	$AudioStreamPlayer.play()

func deselect_numbers_1():
	update_col_3(0)
	current_col = 2
	current_row = selected_letter_1
	update_col_2(current_row)
	letter_1_a.add_theme_font_override("font", font)
	letter_1_b.add_theme_font_override("font", font)
	letter_1_c.add_theme_font_override("font", font)
	letter_1_d.add_theme_font_override("font", font)
	letter_1_e.add_theme_font_override("font", font)
	letter_1_f.add_theme_font_override("font", font)
	letter_1_g.add_theme_font_override("font", font)
	letter_1_h.add_theme_font_override("font", font)
	number_1_container.visible = false

func deselect_numbers_2():
	update_col_5(0)
	current_col = 4
	current_row = selected_letter_2
	update_col_4(current_row)
	letter_2_a.add_theme_font_override("font", font)
	letter_2_b.add_theme_font_override("font", font)
	letter_2_c.add_theme_font_override("font", font)
	letter_2_d.add_theme_font_override("font", font)
	letter_2_e.add_theme_font_override("font", font)
	letter_2_f.add_theme_font_override("font", font)
	letter_2_g.add_theme_font_override("font", font)
	letter_2_h.add_theme_font_override("font", font)
	number_2_1.add_theme_font_override("font", font)
	number_2_2.add_theme_font_override("font", font)
	number_2_3.add_theme_font_override("font", font)
	number_2_4.add_theme_font_override("font", font)
	number_2_5.add_theme_font_override("font", font)
	number_2_6.add_theme_font_override("font", font)
	number_2_7.add_theme_font_override("font", font)
	number_2_8.add_theme_font_override("font", font)
	number_2_container.visible = false

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

func deselect_letters_2():
	update_col_4(0)
	current_col = 3
	current_row = selected_number_1
	update_col_3(current_row)
	number_1_1.add_theme_font_override("font", font)
	number_1_2.add_theme_font_override("font", font)
	number_1_3.add_theme_font_override("font", font)
	number_1_4.add_theme_font_override("font", font)
	number_1_5.add_theme_font_override("font", font)
	number_1_6.add_theme_font_override("font", font)
	number_1_7.add_theme_font_override("font", font)
	number_1_8.add_theme_font_override("font", font)
	letter_2_container.visible = false

func _on_timer_timeout():
	camera_label.add_theme_font_override("font", font)

func _on_move_entered_timer_timeout():
	emit_signal("move",selected_letter_1, selected_number_1, selected_letter_2, selected_number_2)
	deselect_numbers_2()
	deselect_letters_2()
	deselect_numbers_1()
	deselect_letters_1()
	deselect_options()
	
