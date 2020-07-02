extends KinematicBody2D

export (int) var run_speed = 500
export (int) var jump_speed = -1000
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('right_d')
	var left = Input.is_action_pressed("left_a")
	var jump = Input.is_action_just_pressed("jump_w")

	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed

func _physics_process(delta):
	if velocity.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.animation="idle"
	if velocity.x != 0:
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_v = false
		# See the note below about boolean assignment
		$AnimatedSprite.flip_h = velocity.x < 0
	if velocity.y !=0:
		$AnimatedSprite.animation="jump"
	if velocity.x!=0 && velocity.y!=0:
		$AnimatedSprite.animation="jump"
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
