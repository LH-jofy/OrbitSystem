#extends Node3D
#
## Параметры орбиты
#@export var semi_major_axis: float = 10.0
#@export var eccentricity: float = 0.1
#@export var inclination: float = 0.0
#@export var argument_of_periapsis: float = 0.0
#@export var longitude_of_ascending_node: float = 0.0
#
## Внутренние переменные
#var true_anomaly: float = 0.0
#var time_since_periapsis: float = 0.0
#
#func _process(delta: float) -> void:
	#time_since_periapsis += delta
	#true_anomaly = calculate_true_anomaly(time_since_periapsis)
	#update_position()
#
## Обновление положения спутника
#func update_position() -> void:
	#var radius = (semi_major_axis * (1 - pow(eccentricity, 2))) / (1 + eccentricity * cos(true_anomaly))
	#var position_in_orbital_plane = Vector3(radius * cos(true_anomaly), 0, radius * sin(true_anomaly))
#
	#var rotation_matrix = Basis().rotated(Vector3(1, 0, 0), inclination) * Basis().rotated(Vector3(0, 1, 0), argument_of_periapsis)
	#global_transform.origin = rotation_matrix * position_in_orbital_plane
#
## Расчёт истинной аномалии
#func calculate_true_anomaly(time: float) -> float:
	#var mean_anomaly = (2 * PI * time) / (2 * PI * sqrt(pow(semi_major_axis, 3) / (6.67430e-11 * 5.972e24)))
	#var eccentric_anomaly = solve_keplers_equation(mean_anomaly, eccentricity)
	#return 2 * atan(sqrt((1 + eccentricity) / (1 - eccentricity)) * tan(eccentric_anomaly / 2))
#
## Решение уравнения Кеплера
#func solve_keplers_equation(mean_anomaly: float, eccentricity: float, tolerance: float = 1e-6) -> float:
	#var eccentric_anomaly = mean_anomaly
	#var delta = 1.0
	#while abs(delta) > tolerance:
		#delta = (eccentric_anomaly - eccentricity * sin(eccentric_anomaly) - mean_anomaly) / (1 - eccentricity * cos(eccentric_anomaly))
		#eccentric_anomaly -= delta
	#return eccentric_anomaly


#extends Node3D
#
## Параметры орбиты
#@export var semi_major_axis: float = 1000.0    # Большая полуось
#@export var eccentricity: float = 0.001         # Эксцентриситет
#@export var inclination: float = 98.18         # Наклонение (в градусах)
#@export var longitude_of_ascending_node: float = 30.0    # Долгота восходящего узла (в градусах)
#@export var argument_of_periapsis: float = 90.0                # Аргумент перицентра (в градусах)
#
## Параметры спутника
#@export var orbital_period: float = 594.0    # Период обращения спутника (в секундах)
#
#var time: float = 0.0
#
## Функция для применения орбитальных параметров
#func apply_orbital_parameters(point: Vector3) -> Vector3:
	## Применяем аргумент перицентра (вращение вокруг оси Z)
	#point = point.rotated(Vector3.FORWARD, deg_to_rad(argument_of_periapsis))
#
	## Применяем наклонение (вращение вокруг оси X)
	#point = point.rotated(Vector3.RIGHT, deg_to_rad(inclination))
#
	## Применяем долготу восходящего узла (вращение вокруг оси Y)
	#point = point.rotated(Vector3.UP, deg_to_rad(longitude_of_ascending_node))
#
	#return point
#
## Эта функция обновляет положение спутника
#func update_satellite_position(time: float):
	## Вычисляем текущий угол (истинная аномалия) на основе времени
	#var theta: float = fmod(time / orbital_period * 2.0 * PI, 2.0 * PI)
#
	## Вычисляем радиус орбиты для текущего угла
	#var r: float = semi_major_axis * (1 - eccentricity * eccentricity) / (1 + eccentricity * cos(theta))
#
	## Положение спутника в плоскости орбиты
	#var x: float = r * cos(theta)
	#var y: float = r * sin(theta)
	#var z: float = 0.0
#
	## Применяем наклонение, долготу восходящего узла и аргумент перицентра
	#var position: Vector3 = apply_orbital_parameters(Vector3(x, y, z))
#
	## Обновляем позицию спутника
	#self.position = position
#
## Функция для обновления параметров орбиты из внешнего источника
#func update_orbit_parameters(orbital_params: Dictionary) -> void:
	#semi_major_axis = orbital_params["semi_major_axis"]
	#eccentricity = orbital_params["eccentricity"]
	#inclination = orbital_params["inclination"]
	#argument_of_periapsis = orbital_params["argument_of_periapsis"]
	#longitude_of_ascending_node = orbital_params["longitude_of_ascending_node"]
#
## Функция для инициализации спутника
#func initialize_satellite(orbit_data: Dictionary):
	#update_orbit_parameters(orbit_data)
#
## Процесс обновления позиции спутника по времени
#func _process(delta: float):
	#time += delta
	#update_satellite_position(time)


#extends Node3D
#
## Параметры орбиты
#@export var semi_major_axis: float = 1000.0    # Большая полуось
#@export var eccentricity: float = 0.001         # Эксцентриситет
#@export var inclination: float = 98.18         # Наклонение (в градусах)
#@export var longitude_of_ascending_node: float = 30.0    # Долгота восходящего узла (в градусах)
#@export var argument_of_periapsis: float = 90.0                # Аргумент перицентра (в градусах)
#
## Параметры спутника
#@export var orbital_period: float = 594.0    # Период обращения спутника (в секундах)
#
#var time: float = 0.0
#
## Функция для применения орбитальных параметров
#func apply_orbital_parameters(point: Vector3) -> Vector3:
	## Применяем аргумент перицентра (вращение вокруг оси Z)
	#point = point.rotated(Vector3.FORWARD, deg_to_rad(argument_of_periapsis))
#
	## Применяем наклонение (вращение вокруг оси X)
	#point = point.rotated(Vector3.RIGHT, deg_to_rad(inclination))
#
	## Применяем долготу восходящего узла (вращение вокруг оси Y)
	#point = point.rotated(Vector3.UP, deg_to_rad(longitude_of_ascending_node))
#
	#return point
#
## Эта функция обновляет положение спутника
#func update_satellite_position(time: float):
	## Вычисляем текущий угол (истинная аномалия) на основе времени
	#var theta: float = fmod(time / orbital_period * 2.0 * PI, 2.0 * PI)
#
	## Вычисляем радиус орбиты для текущего угла
	#var r: float = semi_major_axis * (1 - eccentricity * eccentricity) / (1 + eccentricity * cos(theta))
#
	## Положение спутника в плоскости орбиты
	#var x: float = r * cos(theta)
	#var y: float = r * sin(theta)
	#var z: float = 0.0
#
	## Применяем наклонение, долготу восходящего узла и аргумент перицентра
	#var position: Vector3 = apply_orbital_parameters(Vector3(x, y, z))
#
	## Обновляем позицию спутника
	#self.position = position
#
## Функция для обновления параметров орбиты из внешнего источника
#func update_orbit_parameters(orbital_params: Dictionary) -> void:
	#semi_major_axis = orbital_params["semi_major_axis"]
	#eccentricity = orbital_params["eccentricity"]
	#inclination = orbital_params["inclination"]
	#argument_of_periapsis = orbital_params["argument_of_periapsis"]
	#longitude_of_ascending_node = orbital_params["longitude_of_ascending_node"]
#
## Функция для инициализации спутника
#func initialize_satellite(orbit_data: Dictionary):
	#update_orbit_parameters(orbit_data)
#
## Процесс обновления позиции спутника по времени
#func _process(delta: float):
	#time += delta
	#update_satellite_position(time)







#extends Node3D
#
## Параметры спутника
#@export var orbital_period: float = 594.0  # Период обращения спутника (в секундах)
#
## Время для расчёта положения спутника
#var time: float = 0.0
#
## Указатель на родительскую орбиту
#var parent_orbit: Node3D = null
#
## Функция для применения орбитальных параметров
#func apply_orbital_parameters(orbit: Node3D, point: Vector3) -> Vector3:
	#point = point.rotated(Vector3.FORWARD, deg_to_rad(orbit.argument_of_periapsis))
	#point = point.rotated(Vector3.RIGHT, deg_to_rad(orbit.inclination))
	#point = point.rotated(Vector3.UP, deg_to_rad(orbit.longitude_of_ascending_node))
	#return point
#
## Эта функция обновляет положение спутника
#func update_satellite_position(time: float):
	#if parent_orbit == null:
		#return
#
	## Получаем параметры орбиты
	#var semi_major_axis = parent_orbit.semi_major_axis
	#var eccentricity = parent_orbit.eccentricity
#
	## Вычисляем текущий угол (истинная аномалия) на основе времени
	#var theta: float = fmod(time / orbital_period * 2.0 * PI, 2.0 * PI)
#
	## Вычисляем радиус орбиты для текущего угла
	#var r: float = semi_major_axis * (1 - eccentricity * eccentricity) / (1 + eccentricity * cos(theta))
#
	## Положение спутника в плоскости орбиты
	#var x: float = r * cos(theta)
	#var y: float = 0.0
	#var z: float = r * sin(theta)
#
	## Применяем параметры орбиты
	#var position: Vector3 = apply_orbital_parameters(parent_orbit, Vector3(x, y, z))
#
	## Обновляем позицию спутника
	#self.position = position
#
## Функция для инициализации спутника с родительской орбитой
#func initialize_satellite(orbit: Node3D):
	#parent_orbit = orbit
#
## Процесс обновления позиции спутника по времени
#func _process(delta: float):
	#time += delta
	#update_satellite_position(time)















extends Node3D

# Параметры орбиты
var semi_major_axis: float = 10.0
var eccentricity: float = 0.1
var inclination: float = 0.0  # В градусах
var argument_of_periapsis: float = 0.0  # В градусах
var longitude_of_ascending_node: float = 0.0  # В градусах

var orbital_period: float = 100.0  # Примерный период орбиты в секундах
var time: float = 0.0  # Время, которое будем отслеживать для движения спутника

func _ready() -> void:
	# Инициализация спутника с параметрами орбиты
	initialize_satellite({
		"semi_major_axis": semi_major_axis,
		"eccentricity": eccentricity,
		"inclination": inclination,
		"argument_of_periapsis": argument_of_periapsis,
		"longitude_of_ascending_node": longitude_of_ascending_node
	})

func initialize_satellite(orbital_params: Dictionary) -> void:
	semi_major_axis = orbital_params["semi_major_axis"]
	eccentricity = orbital_params["eccentricity"]
	inclination = orbital_params["inclination"]
	argument_of_periapsis = orbital_params["argument_of_periapsis"]
	longitude_of_ascending_node = orbital_params["longitude_of_ascending_node"]

# Обновление позиции спутника по орбите
func update_satellite_position(delta: float) -> void:
	# Время проходит с каждым кадром
	time += delta

	# Расчёт истинной аномалии (theta) на основе времени и орбитального периода
	var theta: float = fmod(time / orbital_period * 2.0 * PI, 2.0 * PI)

	# Расчёт радиуса спутника от центрального тела (Земли)
	var r: float = semi_major_axis * (1 - pow(eccentricity, 2)) / (1 + eccentricity * cos(theta))

	# Начальная позиция спутника в плоскости орбиты
	var x: float = r * cos(theta)
	var y: float = 0.0
	var z: float = r * sin(theta)

	# Применяем орбитальные параметры (наклонение, долгота восходящего узла, аргумент перицентра)
	var position: Vector3 = apply_orbital_parameters(Vector3(x, y, z))

	# Обновляем позицию спутника
	self.position = position

# Применение орбитальных параметров к позиции
func apply_orbital_parameters(point: Vector3) -> Vector3:
	point = point.rotated(Vector3.RIGHT, deg_to_rad(inclination))  # Наклонение
	point = point.rotated(Vector3.FORWARD, deg_to_rad(argument_of_periapsis))  # Аргумент перицентра
	point = point.rotated(Vector3.UP, deg_to_rad(longitude_of_ascending_node))  # Долгота восходящего узла
	return point

func _process(delta: float) -> void:
	# Обновляем положение спутника с учётом времени
	update_satellite_position(delta)
