extends Node3D

const Pieces = preload("res://Piece.gd")

var Board = []

@onready var pieces = $Pieces

var ID_count = 0

var piece_models = {
	"pawn": preload("res://Assets/Pawn/pawn.tscn"),
	"knight": preload("res://Assets/Knight/knight.tscn"),
	"bishop": preload("res://Assets/Bishop/bishop.tscn"),
	"rook": preload("res://Assets/Rook/rook.tscn"),
	"queen": preload("res://Assets/Queen/queen.tscn"),
	"king": preload("res://Assets/King/king.tscn")
}

const WHITE_MARBLE = preload("res://Assets/WhiteMarble.tres")
const BLACK_MARBLE = preload("res://Assets/BlackMarble.tres")


var piece_types = {
	"pawn": 1,
	"knight": 3,
	"bishop": 3,
	"rook": 5,
	"queen": 9,
	"king": 999
}

# Called when the node enters the scene tree for the first time.
func _ready():
	Board.resize(64)
	random_board()
	

func random_board():
	ID_count = 0
	for i in range(Board.size()):
		Board[i] = null
	
	for piece_instance in $Pieces.get_children():
		piece_instance.queue_free()
	
	var piece_scores = piece_types.values()
	
	for i in range(16):
		var random_score = piece_scores[randi() % piece_scores.size()]
		
		var color = 1
		
		var piece = Piece.new(random_score, color, GenerateID())
		
		Board[i] = piece
		
	for i in range(48, 64):
		var random_score = piece_scores[randi() % piece_scores.size()]
		
		var color = 0
		
		var piece = Piece.new(random_score, color, GenerateID())
		
		Board[i] = piece
	
	for i in range(64):
		var piece = Board[i]
		if piece != null:
			var piece_type = get_piece_type_from_points(piece.score)
			var piece_scene = piece_models[piece_type]
			
			if piece_scene:
				var piece_instance = piece_scene.instantiate()
				pieces.add_child(piece_instance)
				
				# Set the position on the board
				var position = index_to_board_position(i)
				piece_instance.transform.origin = position
				
				#Assign a unique ID
				#We name the piece instance within the Pieces node with the Piece's ID
				piece_instance.name = str(piece.id)
				
				var material_to_apply
				
				# White or black?
				if piece.color:
					material_to_apply = WHITE_MARBLE
				else: 
					material_to_apply = BLACK_MARBLE
				
				for child in piece_instance.get_children():
					if child is MeshInstance3D:
						child.set_surface_override_material(0, material_to_apply)

func GenerateID():
	ID_count = ID_count+1
	return ID_count

func update_board():
	for i in range(64):
		var piece = Board[i]
		if piece != null:
			var piece_instance = pieces.get_node(str(piece.id))
			var new_position = index_to_board_position(i)
			piece_instance.transform.origin = new_position


func get_piece_type_from_points(points):
	match points:
		1:
			return "pawn"
		4:
			return "knight" 
		3:
			return "bishop"
		5:
			return "rook"
		9:
			return "queen"
		999:
			return "king"
		_:
			return ""

func index_to_board_position(index: int):
	# Base positions
	var top_left = Vector3(-3.5, -1.3, -7.5)
	var tile_size = Vector3(1, 0, 1) 
	
	# Calculate row and column based on index
	var row = index / 8
	var col = index % 8
	
	# Calc the position
	var x_position = top_left.x + col * tile_size.x
	var z_position = top_left.z + row * tile_size.z
	
	return Vector3(x_position, top_left.y, z_position)

func scramble_board():
	for i in range(64):
		var index = randi() % (i + 1)
		var temp = Board[i]
		Board[i] = Board[index]
		Board[index] = temp
	update_board()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		scramble_board()
		#random_board()
