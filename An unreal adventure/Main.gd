extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Janice/Camera2D.set_limit(MARGIN_LEFT,-703.032)
	$Janice/Camera2D.set_limit(MARGIN_TOP,-279.615)
	$Janice/Camera2D.set_limit(MARGIN_RIGHT,8500)
	$Janice/Camera2D.set_limit(MARGIN_BOTTOM,795)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
