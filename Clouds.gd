extends Node3D

# Скорость вращения облаков
@export var rotation_speed: float = 0.1

func _process(delta: float) -> void:
	rotate_y(rotation_speed * delta)
