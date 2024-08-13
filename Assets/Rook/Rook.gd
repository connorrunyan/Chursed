extends Unit

func _init(_id = false):
	var default_coordinate = Vector2i(0, 0)
	var id = -1
	if _id == false:
		id = 0
	piece = RookPiece.new(default_coordinate, 50, false, 0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()
	model = $RookModel
	collision_shape = $CollisionShape3D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)
