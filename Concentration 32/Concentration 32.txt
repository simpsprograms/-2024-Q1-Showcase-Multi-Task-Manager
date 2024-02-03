extends Window

var difficulty = 10
var txt = FileAccess.open("res://Resources/Concentration 32.txt", FileAccess.READ)
var lineno = 0
var labtext = ""
var wordlist = []
var score = 0
var temp2 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	while !txt.eof_reached():
		lineno += 1
		txt.get_line()
	generate(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(position.y < 40):
		position.y = 40
	get_node("Word").set_text(labtext)
	get_node("Score").set_text(str(score) + " / " + str(difficulty*6+4))
	if score >= difficulty*6+4:
		queue_free()


func generate(type):
	match type:
		0:
			txt.seek(0)
			var temp = randi() % lineno
			for value in temp:
				labtext = txt.get_line()
				temp2 += 1
			for value in wordlist.size():
				if(labtext == wordlist[value][1]):
					generate(randi()%2)
					break
		1:
			labtext = wordlist[randi() % (wordlist.size())][1]
		_:
			print("error")
	

func _on_correct_button_pressed():
	for value in wordlist.size():
		if(get_node("Word").get_text() == wordlist[value][1]):
			score -= 1
			generate(randi()%2)
			return
	score += 1
	wordlist.append([temp2, labtext])
	generate(randi()%2)
	


func _on_wrong_button_pressed():
	for value in wordlist.size():
		if(get_node("Word").get_text() == wordlist[value][1]):
			score += 1
			generate(randi()%2)
			return
	score -= 1
	wordlist.append([temp2, labtext])
	generate(randi()%2)
