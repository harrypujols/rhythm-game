extends Node

var location = 0
var track_speed = .005
onready var trailer = find_node('trailer')

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	trailer.set_unit_offset(location)
	location += track_speed


func _on_marker_body_area_shape_entered(area_id, area, area_shape, self_shape):
	print('entered region')


func _on_marker_body_area_shape_exited(area_id, area, area_shape, self_shape):
	print('left region')
