extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 5

func _ready():
	#start_ball()
	pass

func _physics_process(delta):
	var object = move_and_collide(velocity * speed)
	if object:
		velocity = velocity.bounce(object.normal)

func start_ball():
	randomize()
	velocity.x = [-1,1][randi()%2]
	velocity.y = [-0.8,0,8][randi()%2]
