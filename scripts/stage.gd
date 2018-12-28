extends Node

var location = 0
var track_speed = .005
var is_ready = false
onready var trailer = find_node('trailer')

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _input(event):
	if Input.is_action_just_pressed('ui_accept'):
		if is_ready:
			print('note hit!')
			is_ready = false
		else:
			print('fail!')
		
	
func _process(delta):
	trailer.set_unit_offset(location)
	location += track_speed


func _on_marker_body_area_shape_entered(area_id, area, area_shape, self_shape):
	is_ready = true


func _on_marker_body_area_shape_exited(area_id, area, area_shape, self_shape):
	is_ready = false
