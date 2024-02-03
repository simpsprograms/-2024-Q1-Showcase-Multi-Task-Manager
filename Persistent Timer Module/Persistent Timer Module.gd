extends Window

var difficulty = 1

var time = 10.00

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Time").set_text(str(time).pad_decimals(2))
	if(position.y < 40):
		position.y = 40
	if Global.begin:
		time -= delta
		if(time<0 or time>110-(difficulty*10)):
			queue_free()
	else:
		time = 110-(difficulty*10)
		get_node("Limit Label").set_text("Dont exceed: " + str(110-(difficulty*10)).pad_decimals(2))
		get_node("Wind Label").set_text("+" + str(8*(11-difficulty)).pad_decimals(2))

func _on_wind_pressed():
	if Global.begin:
		time += 8*(11-difficulty)
