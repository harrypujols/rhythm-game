extends LinkButton


func restart():
	
	global.final_score = {
		total = 0,
		scored = 0,
		percentage = 0
	}
	
	global.high_score = 0
	
	get_tree().change_scene('res://rooms/stage.tscn')

func _input(event):
	if Input.is_action_just_pressed('ui_accept'):
		restart()

func _on_retry_button_pressed():
	restart()
