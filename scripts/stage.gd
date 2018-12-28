extends Node

var location = 0
var track_speed = .005
onready var route = find_node('route')

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	route.set_unit_offset(location)
	location += track_speed
