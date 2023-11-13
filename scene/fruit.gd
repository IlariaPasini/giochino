extends RigidBody2D
var element  = [[10, 20, 30, 40, 50], [0.045,0.09,  0.135, 0.18, 0.225] ,
[Color8(46,134,171), Color8(69, 31, 85), Color8(114, 78, 145), Color8(229, 79, 109), Color8(248,198,48)]]
var randomic = randi()%element[0].size()
var toRemove = false
signal createElement(pos, rand)
# Called when the node enters the scene tree for the first time.
func _ready():
	grow()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if toRemove:
		queue_free()

func _on_body_entered(body):
	if "randomic" in body:
		if body.randomic == randomic:
			if not body.toRemove:
				toRemove = true
				print("removing body")
			else:
				
				randomic+=1
				if randomic > 4:
					queue_free()
				else:
					grow()

func grow():
	$CollisionShape2D.shape.radius = element[0][randomic]
	$Sprite2D.scale=Vector2(element[1][randomic],element[1][randomic])
	$Sprite2D.modulate = element[2][randomic]
			
