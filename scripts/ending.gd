extends Node

onready var final_score = find_node('final_score')
onready var percentage_label = find_node('percentage')
var score_text = 'You completed {score} of {total} keys'
var percentage_text = '{percentage}% of keys'
var score = String(global.final_score.scored)
var total = String(global.final_score.total)
var percentage = String(global.final_score.percentage)

func _ready():
	final_score.text = score_text.format({'score': score, 'total': total})
	percentage_label.text = percentage_text.format({'percentage': percentage})