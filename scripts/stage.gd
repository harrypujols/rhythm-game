extends Node

var location = 0
var track_speed = .005
var score = 0
var turn = 0
var fails = 3
var total_score
var get_action_button = load('res://interface/action_button.tscn')
var action_button_list = ['down', 'left', 'right', 'left']
onready var trail = find_node('trail')
onready var score_label = find_node('score_label')
onready var action_buttons = get_tree().get_nodes_in_group('action_buttons')

func instance_action_buttons():
	var position = Vector2()
	var gap = 0
	for tag in action_button_list:
		var action_button = get_action_button.instance()
		action_button.tag = tag
		action_button.connect('score', self, 'on_action_button_score')
		trail.add_child(action_button)
#		var size = action_button.find_node('button_hitbox').get_shape().get_extents().x
		action_button.position.x = action_button.position.x + gap
		gap += 80
	
func proccess_score():
	var score_percentage = (float(score) / total_score) * 100
	
	if total_score - score > fails:
		# game over
		global.final_score.total = total_score
		global.final_score.scored = score
		global.final_score.percentage = score_percentage
		get_tree().change_scene('res://rooms/ending.tscn')
	
	else:
		total_score = trail.get_children().size() + total_score

func _ready():
	instance_action_buttons()
	
	score_label.text = String(score)
	total_score = trail.get_children().size()

func _process(delta):
	trail.set_unit_offset(location)
	location += track_speed
	if trail.unit_offset == 1:
		location = 0
		turn += 1
		proccess_score()

	
func on_action_button_score():
	score += 1
	score_label.text = String(score)
