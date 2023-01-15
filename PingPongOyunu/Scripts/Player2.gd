extends KinematicBody2D

var speed = 500
onready var ball = get_tree().get_current_scene().get_node("Ball")

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if abs(ball.position.y-position.y)>25:
		if ball.position.y>position.y:
			velocity = Vector2(0,speed)
		else:
			velocity = Vector2(0,-speed)
	else:
		velocity = Vector2.ZERO
	move_and_slide(velocity)
