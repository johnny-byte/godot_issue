extends Control


func _ready() -> void:
	var picker := MyColorPickerButton.new()
	picker.right_button_click.connect(_on_my_color_picker_right_pressed)
	picker.custom_minimum_size = Vector2(128,128)
	add_child(picker)

func _on_my_color_picker_right_pressed(picker: MyColorPickerButton):
	pass

class MyColorPickerButton extends ColorPickerButton:
	
	signal right_button_click(_self: MyColorPickerButton)
	
	func _init() -> void:	
		gui_input.connect(_on_gui_input)
		
		custom_minimum_size = Vector2(32,0)
	
	func _on_gui_input(input: InputEvent):
#		print(input)
		if input is InputEventMouseButton:
			if input.button_index == MOUSE_BUTTON_RIGHT and input.pressed:
				right_button_click.emit()
	
	
