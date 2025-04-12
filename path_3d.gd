extends Path3D

# Параметры орбиты
@export var semi_major_axis: float = 1000.0  # Большая полуось
@export var semi_minor_axis: float = 700.0   # Малая полуось
@export var inclination: float = -30.0      # Наклонение орбиты (в градусах)
@export var orbit_speed: float =1000     # Скорость движения по орбите

# Ссылка на объект, который движется по орбите
@export var orbiting_object: NodePath

# Внутренние переменные
var path_follow: PathFollow3D

func _ready():
	# Строим орбиту
	build_orbit()

	# Находим PathFollow3D
	path_follow = get_node("PathFollow3D")

	# Привязываем объект к орбите
	if orbiting_object:
		var object = get_node(orbiting_object)
		if object:
			object.reparent(path_follow)

func _process(delta: float):
	# Двигаем объект по орбите
	if path_follow:
		path_follow.progress += orbit_speed * delta

func build_orbit():
	# Очищаем текущую кривую
	curve = Curve3D.new()

	# Строим эллиптическую орбиту
	var points = []
	var step = 20  # Количество точек для построения орбиты
	for i in range(step + 1):
		var angle = 2 * PI * i / step
		var x = semi_major_axis * cos(angle)
		var z = semi_minor_axis * sin(angle)
		var y = 0  # Наклонение пока не учитываем

		# Применяем наклонение
		var rotated_point = Vector3(x, y, z).rotated(Vector3(1, 0, 0), deg_to_rad(inclination))
		points.append(rotated_point)

	# Добавляем точки в кривую
	for point in points:
		curve.add_point(point)
