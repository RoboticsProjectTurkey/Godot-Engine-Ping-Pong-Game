extends Node2D

var a = 3
var score1 = 0
var score2 = 0

func _ready():
	$Timer.start()
	$HUD/Score1.text = str(score1)
	$HUD/Score2.text = str(score2)

func _on_Timer_timeout():
	if a != 0:
		a += -1
		$HUD/Timer_Label.text = str(a)
	else:
		$HUD/Timer_Label.visible = false
		$HUD/Timer_Panel.visible = false
		$Timer.stop()
		a = 3
		$HUD/Timer_Label.text = str(a)
		$Ball.start_ball()


func _on_Area2D1_body_entered(body):
	$Ball.velocity = Vector2.ZERO
	$Ball.position = Vector2(640,352)
	score2+=1
	$HUD/Score2.text = str(score2)
	$HUD/Timer_Label.visible = true
	$HUD/Timer_Panel.visible = true
	$Timer.start()

func _on_Area2D2_body_entered(body):
	$Ball.velocity = Vector2.ZERO
	$Ball.position = Vector2(640,352)
	score1+=1
	$HUD/Score1.text = str(score1)
	$HUD/Timer_Label.visible = true
	$HUD/Timer_Panel.visible = true
	$Timer.start()

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		$Menu.show()
		get_tree().paused = true


func _on_skip_button_pressed():
	$Menu.hide()
	get_tree().paused = false

func _on_close_button_pressed():
	get_tree().quit()
