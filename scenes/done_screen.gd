extends Node2D
@onready var timer: RichTextLabel = $Elapsed_time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.game_finished=true;
	timer.text="You found the Antique Clock in " + str(snapped(Global.total_time, 0.01)) + " seconds! (aprox., it may depend on your fps I guess)"
	if(Global.total_time<Global.record_time):
		Global.record_time=Global.total_time
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
