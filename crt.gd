extends ColorRect

@onready var anim = $AnimationPlayer
@onready var audio = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func animate_switch():
	if anim.is_playing():
		anim.stop()
	anim.play("static")
	audio.play()
