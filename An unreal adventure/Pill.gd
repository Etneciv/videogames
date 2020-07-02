extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var life
var collision=0
export (int) var pointsP
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Pill_body_entered(body):
	print(body.get_name())
	pointsP=+100
	
	if (body.get_name() == "Janice"):
		hide()
		#life = get_node("../Player1").life
		#if (collision==0):
			#get_node("../LifeP1").text = str("Lives: ",life, " Points:",points)
			#if ($Laugh.playing == false):
				#$Laugh.play()
		collision+=1
	pass # Replace with function body.
