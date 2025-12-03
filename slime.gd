extends Node2D


var direction = 1
@onready var ray_cast_2d_right: RayCast2D = $RayCast2DRight
@onready var ray_cast_2d_left: RayCast2D = $RayCast2DLeft


const SPEED = 60
# Called every fram. "delta"  is the elapsed time since the previous frame
func _process(delta):
	
	if  ray_cast_2d_right.is_colliding():
		direction = 1
		print("direction changed right")		
	if ray_cast_2d_left.is_colliding():
		direction = -1
		print("direction changed ;eft")	
		
		
	position.x += direction * delta *  SPEED
