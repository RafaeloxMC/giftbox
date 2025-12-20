extends Label

func _ready() -> void:
	self.text = format_system_time()

func _process(_delta: float) -> void:
	self.text = format_system_time()

func format_system_time() -> String:
	var dt: Dictionary = Time.get_datetime_dict_from_system()
	
	var days: Array[String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
	var months: Array[String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
	
	var weekday: String = days[dt.weekday]
	var month: String = months[dt.month - 1]
	var day: int = dt.day
	var year: int = dt.year
	
	var hour_12: int = dt.hour % 12
	if hour_12 == 0:
		hour_12 = 12
	var minute: String = str(dt.minute).pad_zeros(2)
	var am_pm: String = "AM" if dt.hour < 12 else "PM"
	
	var formatted_time: String = "%s, %s %d %d, %d:%s %s" % [weekday, month, day, year, hour_12, minute, am_pm]
	return formatted_time
