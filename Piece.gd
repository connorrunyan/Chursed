extends Node

class_name Piece

var score: int
var color: bool
var id: int

func _init(S, C, ID):
	self.score = S
	self.color = C
	self.id = ID

func print_Info():
	print("Score: ", score)
	print("Color: ", color)
	print("\n")
