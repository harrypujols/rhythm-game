extends Node

var location = 0
var track_speed = .005
var score = 0
onready var trail = find_node('trail')
onready var score_label = find_node('score_label')
onready var action_buttons = get_tree().get_nodes_in_group('action_buttons')

func _ready():
	score_label.text = String(score)
	for action_button in action_buttons:
		action_button.connect('score', self, 'on_action_button_score')

func _process(delta):
	trail.set_unit_offset(location)
	location += track_speed

func on_action_button_score():
	score += 1
	score_label.text = String(score)
