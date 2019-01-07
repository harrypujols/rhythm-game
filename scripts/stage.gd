extends Node

var location = 0
var track_speed = .005
var is_ready = false
var score = 0
onready var trailer = find_node('trailer')
onready var score_label = find_node('score_label')
onready var action_button = find_node('action_button')

func _ready():
	score_label.text = String(score)
	action_button.connect('action_taken', self, 'on_action_button_pressed', [action_button.tag])

func _process(delta):
	trailer.set_unit_offset(location)
	location += track_speed

func on_action_button_pressed(tag):
	if is_ready:
			score += 1
			is_ready = false
	else:
		print('fail')
		
	score_label.text = String(score)

func _on_marker_body_area_shape_entered(area_id, area, area_shape, self_shape):
	is_ready = true


func _on_marker_body_area_shape_exited(area_id, area, area_shape, self_shape):
	is_ready = false
