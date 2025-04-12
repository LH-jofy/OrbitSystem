extends Camera3D

# Цель (Земля)
@export var target: Node3D

# Скорость зумирования
@export var zoom_speed: float = 10.0

# Минимальное и максимальное расстояние для зумирования
@export var min_distance: float = 1000.0
@export var max_distance: float = 3000.0

func _input(event: InputEvent) -> void:
	# Зумирование с помощью колеса мыши
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom(-zoom_speed)
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom(zoom_speed)

# Зумирование камеры
func zoom(amount: float) -> void:
	if target == null:
		print("Ошибка: цель (target) не назначена.")
		return

	# Вычисляем новую позицию камеры
	var new_position = position + transform.basis.z * amount

	# Вычисляем расстояние до цели
	var distance = new_position.distance_to(target.global_transform.origin)

	# Проверяем, чтобы расстояние было в пределах min_distance и max_distance
	if distance > min_distance and distance < max_distance:
		position = new_position
