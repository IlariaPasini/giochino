extends Node2D
#permette di fare il preload
var fruit_scene : PackedScene = preload("res://scene/fruit.tscn")
# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_drop(pos : Vector2):
	#creo l'oggetto frutto e lo aggiungo come figlio al main, permette di creare diversi frutti
	
	var fruit = fruit_scene.instantiate()
	fruit.position = pos
	$Fruits.add_child(fruit)


