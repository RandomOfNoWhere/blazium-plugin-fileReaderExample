@tool
#extends Button
extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	var button = Button.new()
	button.text = "Import Files"
	button.pressed.connect(self._button_pressed)
	add_child(button)

func _button_pressed():
	print("Importing files...")
	
	# https://docs.godotengine.org/en/stable/classes/class_fileaccess.html
	var path =  "/home/randomofnowhere/Downloads/BlaziumLatest_29_Oct_2024/blazium/tinkerPluginFiles/locations.txt"
	var locFile = FileAccess.open(path, FileAccess.READ)
	#Read as one chunk of text
	var content = locFile.get_as_text(true) #The true removes the \r leaving on a \n for a new line
	#print(content) #Just used to make sure the file is loaded
	var sliceCount = content.get_slice_count("\n")
	print("Slices: "+str(sliceCount)) #Must convert to string or method will fail
	#https://docs.godotengine.org/en/stable/classes/class_string.html#class-string-method-split
	for line in content.split("\n"): 
		print("Item:["+line+"]")
	
	#Read line by line (Does not work, but was from an older example)
	#var line_counter = 0
	#while not locFile.eof_reached(): 
	#	line_counter+=1 
	#	print("Line: "+line_counter+" is ["+locFile.get_line()+"]")
	
	print("Done importing files...")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
