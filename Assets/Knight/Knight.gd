extends Unit

func _init(_id = false):
	var default_coordinate = Vector2i(0, 0)
	var id = -1
	if _id == false:
		id = 0
	piece = KnightPiece.new(default_coordinate, 30, false, id)

func _ready() -> void:
	rng.randomize()
	model = $KnightModel
	collision_shape = $CollisionShape3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)

