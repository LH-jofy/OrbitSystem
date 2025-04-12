extends Node3D

# Скорость вращения в градусах за секунду
@export var rotation_speed: float = 2 * 3.14 * 63.78 / 86164.0 # Можно менять в инспекторе

# Вектор оси вращения (ось Y)
var rotation_axis: Vector3 = Vector3(0, 1, 0)

	
func _process(delta: float) -> void:
	# Вращение вокруг оси Y
	rotate(rotation_axis.normalized(), rotation_speed * delta)
