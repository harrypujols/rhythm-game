extends Node

export var track_speed = 1
var score = 0
var fails = 0
var max_fails = 3
var total_score
var position = Vector2()
var get_action_button = load('res://interface/action_button.tscn')
var action_button_list = ['down', 'left', 'right', 'left']
var action_button_separation = 80
var gap = 0
onready var start_point = get_viewport().size.x
onready var track = find_node('track')
onready var score_label = find_node('score_label')
onready var action_buttons = get_tree().get_nodes_in_group('action_buttons')

func instance_action_buttons():
	for tag in action_button_list:
		var action_button = get_action_button.instance()
		action_button.tag = tag
		action_button.connect('score', self, 'on_action_button_score')
		action_button.connect('fail', self, 'on_action_button_fail')
		track.add_child(action_button)
		action_button.position.x = action_button.position.x + gap
		gap += action_button_separation

func track_movement():
	track.position.x -= track_speed
	if track.position.x <= -(gap):
		track.position.x = start_point
		reset_action_buttons()
		proccess_score()
	
func reset_action_buttons():
	var action_buttons = get_tree().get_nodes_in_group('action_buttons')
	for action_button in action_buttons:
		action_button.reset_color()
	
func proccess_score():
	var score_percentage = (float(score) / total_score) * 100
	
	if fails >= max_fails:
		global.final_score.total = total_score
		global.final_score.scored = score
		global.final_score.percentage = score_percentage
		get_tree().change_scene('res://rooms/ending.tscn')
	
	else:
		total_score = track.get_children().size() + total_score

func _ready():
	instance_action_buttons()
	score_label.text = String(score)
	total_score = track.get_children().size()

func _process(delta):
	track_movement()

	
func on_action_button_score():
	score += 1
	score_label.text = String(score)

func on_action_button_fail():
	fails += 1
