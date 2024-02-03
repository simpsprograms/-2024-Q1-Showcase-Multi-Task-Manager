extends Window

var difficulty = 10;
var day = 1;
var date = ""
var date_dict = {}
var start_temp = false

# Called when the node enters the scene tree for the first time.
func _ready():
	date = generate_date()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(position.y < 40):
		position.y = 40
	if day < 0:
		day = 6
	if day > 6:
		day = 0
	get_node("Day").set_text(get_day(day))
		

func get_month(month_int):
	match month_int:
		1:
			return "Jan"
		2:
			return "Feb"
		3:
			return "Mar"
		4:
			return "Apr"
		5:
			return "May"
		6:
			return "Jun"
		7:
			return "Jul"
		8:
			return "Aug"
		9:
			return "Sep"
		10:
			return "Oct"
		11:
			return "Nov"
		12:
			return "Dec"
		_:
			print("error")

func get_day(day_int):
	match day_int:
		1:
			return "Monday"
		2:
			return "Tuesday"
		3:
			return "Wednesday"
		4:
			return "Thursday"
		5:
			return "Friday"
		6:
			return "Saturday"
		0:
			return "Sunday"
		_:
			print("error")
			
func trbr(val):
	var m = floor((sqrt(8*val+1) - 1) / 2)
	return val - m*(m+1)/2 + 1
			
func generate_date():
	var temp = ""
	var temp1 = 0
	var temp2 = 0
	var temp3 = randi()%12+1
	var disptext = ""
	date_dict = Time.get_datetime_dict_from_system(true)
	temp1 = date_dict.year
	if randi()%2 == 0:
		temp1 += int(trbr(randi()%(difficulty*20))-1)
	else:
		temp1 -= int(trbr(randi()%(difficulty*20))-1)
	temp += str(temp1)
	temp += "-"
	if temp3 < 10:
		temp += "0"
	temp += str(temp3)
	temp += "-"
	if (temp3%2==1&&temp3<8) or (temp3%2==1&&temp3>7):
		temp2 = randi()%31+1
	elif temp3 == 2:
		if temp2%4==0 && temp2%100!=0:
			temp2 = randi()%29+1
		else:
			temp2 = randi()%28+1
	else:
		temp2 = randi()%30+1
	if temp2 < 10:
		temp += "0"
	temp += str(temp2)
	disptext += str(temp2) + " "
	disptext += get_month(temp3) + " \'"
	disptext += str(temp1%100)
	get_node("Date").set_text(disptext)
	return temp
		

func _on_left_pressed():
	day -= 1


func _on_right_pressed():
	day += 1


func _on_day_pressed():
	if(Global.begin):
		date_dict = Time.get_datetime_dict_from_unix_time(Time.get_unix_time_from_datetime_string(date))
		if day == date_dict.weekday:
			queue_free()
		else:
			date = generate_date()
		
		
