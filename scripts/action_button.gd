extends Node2D

const input_text = {
	'a': 'a',
	'b': 'b',
	'y': 'y',
	'x': 'x',
	'square': '[',
	'circle': 'o',
	'triangle': 't',
	'arrow_key': '^',
	'key': 'k',
	'delete': 'd',
	'enter': '<',
	'spacebar': 'u',
	'esc': 'e'
}

const arrow_direction = {
	'up': 0,
	'down': 180,
	'left': -90,
	'right': 90
}

export(int, 'up', 'down', 'left', 'right') var button_name

func _ready():
	self.set_rotation_degrees(arrow_direction.right)
	$button_icon.set_text(input_text.arrow_key)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
