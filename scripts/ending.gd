extends Node

onready var final_score = find_node('final_score')
onready var percentage_label = find_node('percentage')
var score_text = 'You completed {score} of {total} keys'
var percentage_text = '{percentage}% of keys'
var score = String(global.final_score.scored)
var high_score = String(global.final_score.high_score)
var total = String(global.final_score.total)
var percentage = String(global.final_score.percentage)


func get_high_score():
	global.load_game()

	if score > high_score:
		high_score = score
		global.save_game()
	
	print(high_score)

func _ready():
	get_high_score()
	final_score.text = score_text.format({'score': score, 'total': total})
	percentage_label.text = percentage_text.format({'percentage': percentage})