#extends Node3D
#
## Скорость вращения Земли (в радианах в секунду)
#var rotation_speed: float = TAU / 86164.0  # TAU = 2 * PI, полный оборот
#
#func _ready() -> void:
	## Наклон оси Земли (23.5 градуса)
	#rotation_degrees.x = 23.5
#
#func _process(delta: float) -> void:
	## Вращение Земли вокруг своей оси (ось Y)
	#rotate_y(rotation_speed * delta)


#extends Node3D
#
## Скорость вращения Земли (в радианах в секунду)
#var rotation_speed: float = TAU / 86164.0  # TAU = 2 * PI, полный оборот за 86164 секунды
#
#func _ready() -> void:
	## Наклон оси вращения (23.5 градуса)
	#rotation_degrees = Vector3(23.5, 0, 0)
	## Масштабируем Землю до реальных размеров (радиус ≈ 6 371 000 метров)
	#scale = Vector3(6371000, 6371000, 6371000)
#
#func _process(delta: float) -> void:
	## Вращение Земли вокруг своей оси (ось Y)
	#rotate_y(rotation_speed * delta)


#extends Node3D
#
## Скорость вращения в градусах за секунду
#@export var rotation_speed: float = 15.0  # Можно настроить в инспекторе
#
#func _ready():
	## Устанавливаем наклон оси на 23.5° относительно локальной оси X
	#rotation_degrees.x = 23.5
#
#func _process(delta: float):
	## Вращение вокруг локальной оси Y
	#rotate_y(deg_to_rad(rotation_speed * delta))



#extends Node3D
#
## Скорость вращения в градусах за секунду
##@export var rotation_speed: float = TAU / 86164.0
#@export var rotation_speed: float = 2*3.14*637.8/86164.0  # Можно менять в инспекторе
#
## Вектор оси вращения
#var rotation_axis: Vector3 = Vector3(0, 1, 0)
#
#func _ready():
	## Устанавливаем наклон Земли на 23.5° относительно оси X
	#rotation_degrees.x = 23.5
	#
	## После наклона вращение должно быть относительно локальной оси Z
	#rotation_axis = global_transform.basis.y
#
#func _process(delta: float):
	## Вращение вокруг наклонённой оси (локальная ось Z после наклона)
	#rotate(rotation_axis.normalized(), deg_to_rad(rotation_speed))
	
	
	
	
#extends Node3D
#
## Скорость вращения при автоматическом вращении (в градусах за секунду)
#@export var auto_rotation_speed: float = 2 * 3.14 * 6378 / 86164.0  # Можно менять в инспекторе
#
## Углы вращения вокруг осей (X, Y, Z) в градусах
#@export var rotation_angles: Vector3 = Vector3(1, 45, 1)  # Например: 90° по Y и 45° по Z
#
## Скорость вращения при помощи мыши
#@export var mouse_rotation_speed: float = 0.5
#
## Переменные для отслеживания вращения мышью
#var is_mouse_rotating: bool = false
#var previous_mouse_position: Vector2 = Vector2()
#var saved_rotation: Basis = Basis.IDENTITY
#
## Вектор оси вращения
#var rotation_axis: Vector3 = Vector3(0, 1, 0)
#
#func _ready():
	## Устанавливаем наклон объекта на 23.5° относительно оси X
	#rotation_degrees.x = 23.5
	#
	## После наклона вращение должно быть относительно локальной оси Y
	#rotation_axis = global_transform.basis.y
#
#func _process(delta: float) -> void:
	#if is_mouse_rotating:
		## Вращение при помощи мыши
		#rotate_with_mouse(delta)
	#else:
		## Автоматическое вращение
		#auto_rotate(delta)
#
#func auto_rotate(delta: float) -> void:
	## Вращение вокруг наклонённой оси (локальная ось Y после наклона)
	#rotate(rotation_axis.normalized(), deg_to_rad(auto_rotation_speed * delta))
#
	## Дополнительное вращение по заданным углам
	#var delta_rotation = rotation_angles * auto_rotation_speed * delta
	#rotate_object_local(Vector3(1, 0, 0), deg_to_rad(delta_rotation.x))  # Поворот по оси X
	#rotate_object_local(Vector3(0, 1, 0), deg_to_rad(delta_rotation.y))  # Поворот по оси Y
	#rotate_object_local(Vector3(0, 0, 1), deg_to_rad(delta_rotation.z))  # Поворот по оси Z
#
#func _input(event: InputEvent) -> void:
	## Проверяем, что нажата правая кнопка мыши
	#if event is InputEventMouseButton:
		#if event.button_index == 2:  # 2 - это индекс правой кнопки мыши
			#if event.pressed:
				## Начинаем вращение при нажатии правой кнопки
				#is_mouse_rotating = true
				#previous_mouse_position = get_viewport().get_mouse_position()
				## Сохраняем текущую ориентацию
				#saved_rotation = transform.basis
			#else:
				## Прекращаем вращение при отпускании правой кнопки
				#is_mouse_rotating = false
				## Возвращаем в сохранённое положение
				#transform.basis = saved_rotation
#
#func rotate_with_mouse(delta: float) -> void:
	## Получаем текущее смещение мыши
	#var mouse_motion = get_viewport().get_mouse_position() - previous_mouse_position
#
	## Рассчитываем вращение на основе смещения мыши
	#var rotation_delta_x = mouse_motion.y * mouse_rotation_speed  # Вращение по оси X
	#var rotation_delta_y = mouse_motion.x * mouse_rotation_speed  # Вращение по оси Y
#
	## Применяем вращение относительно глобальных осей (не зависим от текущего положения объекта)
	#rotate(Vector3(1, 0, 0), deg_to_rad(rotation_delta_x))  # Поворот по оси X
	#rotate(Vector3(0, 1, 0), deg_to_rad(rotation_delta_y))  # Поворот по оси Y
#
	## Обновляем позицию мыши
	#previous_mouse_position = get_viewport().get_mouse_position()





extends Node3D

# Скорость вращения при автоматическом вращении (в градусах за секунду)
@export var auto_rotation_speed: float = 2 * 3.14 * 637.8 / 86164.0  # Можно менять в инспекторе

# Скорость вращения при помощи мыши
@export var mouse_rotation_speed: float = 0.5

# Переменные для отслеживания вращения мышью
var is_mouse_rotating: bool = false
var previous_mouse_position: Vector2 = Vector2()
var saved_rotation: Basis = Basis.IDENTITY

# Вектор оси вращения
var rotation_axis: Vector3 = Vector3(0, 1, 0)

func _ready():
	# Устанавливаем наклон объекта на 23.5° относительно оси X
	rotation_degrees.x = 23.5
	
	# После наклона вращение должно быть относительно локальной оси Y
	rotation_axis = global_transform.basis.y

func _process(delta: float) -> void:
	if is_mouse_rotating:
		# Вращение при помощи мыши
		rotate_with_mouse(delta)
	else:
		# Автоматическое вращение
		auto_rotate(delta)

func auto_rotate(delta: float) -> void:
	# Вращение вокруг наклонённой оси (локальная ось Y после наклона)
	rotate(rotation_axis.normalized(), deg_to_rad(auto_rotation_speed))

func _input(event: InputEvent) -> void:
	# Проверяем, что нажата правая кнопка мыши
	if event is InputEventMouseButton:
		if event.button_index == 2:  # 2 - это индекс правой кнопки мыши
			if event.pressed:
				# Начинаем вращение при нажатии правой кнопки
				is_mouse_rotating = true
				previous_mouse_position = get_viewport().get_mouse_position()
				# Сохраняем текущую ориентацию
				saved_rotation = transform.basis
			else:
				# Прекращаем вращение при отпускании правой кнопки
				is_mouse_rotating = false
				# Возвращаем в сохранённое положение
				transform.basis = saved_rotation

func rotate_with_mouse(delta: float) -> void:
	# Получаем текущее смещение мыши
	var mouse_motion = get_viewport().get_mouse_position() - previous_mouse_position

	# Рассчитываем вращение на основе смещения мыши
	var rotation_delta_x = -mouse_motion.y * mouse_rotation_speed  # Вращение по оси X
	var rotation_delta_y = mouse_motion.x * mouse_rotation_speed  # Вращение по оси Y

	# Применяем вращение относительно глобальных осей (не зависим от текущего положения объекта)
	rotate(Vector3(0, 0, 1), deg_to_rad(rotation_delta_x))  # Поворот по оси X
	rotate(Vector3(0, 1, 0), deg_to_rad(rotation_delta_y))  # Поворот по оси Y

	# Обновляем позицию мыши
	previous_mouse_position = get_viewport().get_mouse_position()
