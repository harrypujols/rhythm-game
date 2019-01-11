extends Node

onready var final_score = find_node('final_score')
onready var percentage_label = find_node('percentage')
onready var best = find_node('best')
onready var save = get_node('save')
var score_text = 'You completed {score} of {total} keys'
var percentage_text = '{percentage}% of keys'
var score = global.final_score.scored
var total = String(global.final_score.total)
var percentage = String(global.final_score.percentage)


func get_high_score():
	if score > global.high_score:
		global.high_score = score
		save.save_game()
		best.text = 'Best score!'
	
	print(global.high_score)

func _ready():
	get_high_score()
	final_score.text = score_text.format({'score': String(score), 'total': total})
	percentage_label.text = percentage_text.format({'percentage': percentage})