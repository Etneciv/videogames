extends KinematicBody2D

export (int) var speed
var onTheMove = Vector2()
var screen_size
var direccion = 1
var collision

var pos=get_position()
func _ready():
	#hide() #Ocultar el personaje
	show()
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	onTheMove = Vector2() #Reinicia el valor
	
	collision = move_and_collide(onTheMove * delta)

	#if (position.x < 15): #Derecha
	#	direccion = 1
	#elif(position.x > (screen_size.x - 10)): #Izquierda
	#	direccion = direccion * (-1)
	
	onTheMove.x += direccion
	
	if onTheMove.length() > 0: #Verificar si esta en movimietno
		onTheMove = onTheMove.normalized() * speed #Normalizar
	
	move_and_slide(onTheMove * delta)
	
	if (get_slide_count() > 0):
		direccion = direccion * (-1)
	
	#position +=  #Actualizar los movimientos
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
	
	if onTheMove.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = direccion < 0
