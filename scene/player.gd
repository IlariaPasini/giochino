extends Node2D
var velocity: int = 200; #pixel al secondo
var canDrop: bool = true
signal drop(pos : Vector2);


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("Left")):
		position.x -= velocity*delta
	if(Input.is_action_pressed("Right")):
		position.x += velocity*delta
	if(Input.is_action_pressed("Drop") and canDrop):
		canDrop = false
		drop.emit(position)
		$DropDelay.start()


func _on_drop_delay_timeout():
	canDrop =true # Replace with function body.
