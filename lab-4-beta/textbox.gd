extends CanvasLayer

@onready var textbox_container = $TextboxContainer
@onready var start_symbol = $MarginContainer/MarginContainer/HBoxContainer/Start
@onready var end_symbol = $MarginContainer/MarginContainer/HBoxContainer/end
@onready var label = $MarginContainer/MarginContainer/HBoxContainer/Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide_textbox() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hide_textbox():
	start_symbol.text = ""
	end_symbol.text = ""
	label.text =""
