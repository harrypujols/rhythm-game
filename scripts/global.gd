extends Node

var final_score = {
	'total': 0,
	'scored': 0,
	'percentage': 0,
	'high_score': 0
}

const path = 'user://save.filex'

static func load_game():
	var file = File.new()
	if not file.file_exists(path):
		#if there's not such file
		save_game()
		return
		
	file.open(path, file.READ)
	var text = file.get_as_text()
	file.close()
	var result_json = JSON.parse(text)
	if result_json.error == OK:
		print('loading')
		global.final_score = result_json.result
		print(result_json.result)
	else:
    	print('Error: ', result_json.error)
    	print('Error Line: ', result_json.error_line)
    	print('Error String: ', result_json.error_string)

static func save_game():
	var file = File.new()
	file.open(path, File.WRITE)
	print('saving')
	file.store_string(global.final_score)
	file.close()