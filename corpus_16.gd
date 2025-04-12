extends Node3D

# Параметры орбиты (должны быть переданы из скрипта орбиты)
var semi_major_axis: float = 1000.0    # Большая полуось
var eccentricity: float = 0.001         # Эксцентриситет
var inclination: float = 98.18         # Наклонение (в градусах)
var longitude_of_ascending_node: float = 30.0    # Долгота восходящего узла (в градусах)
var argument_of_periapsis: float = 90.0                # Аргумент перицентра (в градусах)
var orbital_period: float = 594.0    # Период обращения спутника (в секундах)

# Внутренние переменные
var time: float = 0.0  # Время для анимации спутника

func _process(delta: float):
	time += delta
	update_position()

# Обновление положения спутника
func update_position():
	# Вычисляем текущий угол (истинная аномалия) на основе времени
	var theta: float = fmod(time / orbital_period * 2.0 * PI, 2.0 * PI)

	# Вычисляем радиус орбиты для текущего угла
	var r: float = semi_major_axis * (1 - eccentricity * eccentricity) / (1 + eccentricity * cos(theta))

	# Положение спутника в плоскости орбиты
	var x: float = r * cos(theta)
	var y: float = r * sin(theta)
	var z: float = 0.0

	# Применяем наклонение, долготу восходящего узла и аргумент перицентра
	var position: Vector3 = apply_orbital_parameters(Vector3(x, y, z))

	# Обновляем позицию спутника
	global_transform.origin = position

# Применение параметров орбиты к точке
func apply_orbital_parameters(point: Vector3) -> Vector3:
	# Применяем аргумент перицентра (вращение вокруг оси Z)
	point = point.rotated(Vector3.FORWARD, deg_to_rad(argument_of_periapsis))

	# Применяем наклонение (вращение вокруг оси X)
	point = point.rotated(Vector3.RIGHT, deg_to_rad(inclination))

	# Применяем долготу восходящего узла (вращение вокруг оси Y)
	point = point.rotated(Vector3.UP, deg_to_rad(longitude_of_ascending_node))

	return point

# Установка параметров орбиты
func set_orbit_parameters(new_semi_major_axis: float, new_eccentricity: float, new_inclination: float, new_longitude_of_ascending_node: float, new_argument_of_periapsis: float, new_orbital_period: float):
	semi_major_axis = new_semi_major_axis
	eccentricity = new_eccentricity
	inclination = new_inclination
	longitude_of_ascending_node = new_longitude_of_ascending_node
	argument_of_periapsis = new_argument_of_periapsis
	orbital_period = new_orbital_period
