extends Node

const path = 'user://game.sav'

func load_game():
	var file = File.new()
	if not file.file_exists(path):
		save_game()
		return
		
	file.open(path, file.READ)
	print('loading')
	var high_score = file.get_var()
	file.close()
	global.high_score = high_score
	return high_score

func save_game():
	var file = File.new()
	file.open(path, File.WRITE)
	print('saving')
	file.store_var(global.high_score)
	file.close()

func _ready():
	load_game()