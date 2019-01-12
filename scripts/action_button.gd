extends Node2D

const action = {
	'up': {
		'degree': 0,
		'input': 'ui_up',
		'text': '^'
	},
	
	'down': {
		'degree': 180,
		'input': 'ui_down',
		'text': '^'
	},
	
	'left': {
		'degree': -90,
		'input': 'ui_left',
		'text': '^'
	},
	
	'right': {
		'degree': 90,
		'input': 'ui_right',
		'text': '^'
	}
}

var action_ready = false
var scored = false
var color_red = Color('#dc322f')
var color_white = Color('#ffffff')
signal score

export(String, 'up', 'down', 'left', 'right') var tag = 'left'

func set_button_tags():
	self.set_rotation_degrees(action[tag].degree)
	$button_icon.set_text(action[tag].text)

func _ready():
	set_button_tags()

func _input(event):
	if Input.is_action_just_pressed(action[tag].input):
		if action_ready:
			scored = true
			emit_signal('score')
			action_ready = false

func _on_button_body_area_shape_entered(area_id, area, area_shape, self_shape):
	print(area.name)
	action_ready = true

func _on_button_body_area_shape_exited(area_id, area, area_shape, self_shape):
	action_ready = false
	print('exited')
	if not scored:
		$button_icon.set('custom_colors/font_color', color_red)
