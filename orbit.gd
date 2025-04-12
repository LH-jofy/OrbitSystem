#extends Node3D
#
## Параметры орбиты
#@export var semi_major_axis: float = 1000.0    # Большая полуось
#@export var eccentricity: float = 0.001         # Эксцентриситет
#@export var inclination: float = 98.18         # Наклонение (в градусах)
#@export var longitude_of_ascending_node: float = 30.0    # Долгота восходящего узла (в градусах)
#@export var argument_of_periapsis: float = 90.0                # Аргумент перицентра (в градусах)
#
## Визуализация орбиты
#@export var orbit_resolution: int = 100    # Количество точек для отрисовки орбиты
#@export var orbit_color: Color = Color(1, 0, 0)    # Цвет орбиты
#
#var orbit_points: Array[Vector3] = []
#
#func _ready():
	#generate_orbit()
#
#func generate_orbit():
	#orbit_points.clear()
#
	#for i in range(orbit_resolution):
		## Угол (истинная аномалия)
		#var theta: float = deg_to_rad(i * 360.0 / orbit_resolution)
#
		## Радиус орбиты в зависимости от угла
		#var r: float = semi_major_axis * (1 - eccentricity * eccentricity) / (1 + eccentricity * cos(theta))
#
		## Положение точки в плоскости орбиты
		#var x: float = r * cos(theta)
		#var y: float = r * sin(theta)
		#var z: float = 0.0
#
		## Применяем наклонение, долготу восходящего узла и аргумент перицентра
		#var point: Vector3 = Vector3(x, y, z)
		#point = apply_orbital_parameters(point)
#
		#orbit_points.append(point)
#
	## Визуализация орбиты
	#draw_orbit()
#
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
#func draw_orbit():
	#var immediate_mesh: ImmediateMesh = ImmediateMesh.new()
	#var mesh_instance: MeshInstance3D = MeshInstance3D.new()
	#mesh_instance.mesh = immediate_mesh
	#add_child(mesh_instance)
#
	#var material: StandardMaterial3D = StandardMaterial3D.new()
	#material.albedo_color = orbit_color
	#material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
#
	#immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINE_STRIP, material)
#
	#for point in orbit_points:
		#immediate_mesh.surface_add_vertex(point)
#
	#immediate_mesh.surface_end()



#extends Node3D
#
## Параметры орбиты
#@export var semi_major_axis: float = 1000.0    # Большая полуось
#@export var eccentricity: float = 0.001         # Эксцентриситет
#@export var inclination: float = 98.18         # Наклонение (в градусах)
#@export var longitude_of_ascending_node: float = 30.0    # Долгота восходящего узла (в градусах)
#@export var argument_of_periapsis: float = 90.0                # Аргумент перицентра (в градусах)
#
## Визуализация орбиты
#@export var orbit_resolution: int = 100    # Количество точек для отрисовки орбиты
#@export var orbit_color: Color = Color(1, 0, 0)    # Цвет орбиты
#
## Параметры спутника
#@export var satellite_scene: PackedScene    # Сцена спутника
#@export var orbital_period: float = 594.0    # Период обращения спутника (в секундах)
#
#var orbit_points: Array[Vector3] = []
#var satellite: Node3D = null
#var time: float = 0.0
#
#func _ready():
	#generate_orbit()
	#place_satellite()
#
#func generate_orbit():
	#orbit_points.clear()
#
	#for i in range(orbit_resolution):
		## Угол (истинная аномалия)
		#var theta: float = deg_to_rad(i * 360.0 / orbit_resolution)
#
		## Радиус орбиты в зависимости от угла
		#var r: float = semi_major_axis * (1 - eccentricity * eccentricity) / (1 + eccentricity * cos(theta))
#
		## Положение точки в плоскости орбиты
		#var x: float = r * cos(theta)
		#var y: float = r * sin(theta)
		#var z: float = 0.0
#
		## Применяем наклонение, долготу восходящего узла и аргумент перицентра
		#var point: Vector3 = Vector3(x, y, z)
		#point = apply_orbital_parameters(point)
#
		#orbit_points.append(point)
#
	## Визуализация орбиты
	#draw_orbit()
#
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
#func draw_orbit():
	#var immediate_mesh: ImmediateMesh = ImmediateMesh.new()
	#var mesh_instance: MeshInstance3D = MeshInstance3D.new()
	#mesh_instance.mesh = immediate_mesh
	#add_child(mesh_instance)
#
	#var material: StandardMaterial3D = StandardMaterial3D.new()
	#material.albedo_color = orbit_color
	#material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
#
	#immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINE_STRIP, material)
#
	#for point in orbit_points:
		#immediate_mesh.surface_add_vertex(point)
#
	#immediate_mesh.surface_end()
#
#func place_satellite():
	#if satellite_scene == null:
		#return
#
	#satellite = satellite_scene.instantiate()
	#add_child(satellite)
#
	## Размещаем спутник в начальной точке орбиты
	#update_satellite_position(0.0)
#
#func update_satellite_position(time: float):
	#if satellite == null:
		#return
#
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
	#satellite.global_transform.origin = position
#
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
## Визуализация орбиты
#@export var orbit_resolution: int = 100    # Количество точек для отрисовки орбиты
#@export var orbit_color: Color = Color(1, 0, 0)    # Цвет орбиты
#
## Параметры спутника
#@export var satellite_scene: PackedScene    # Сцена спутника
#@export var orbital_period: float = 594.0    # Период обращения спутника (в секундах)
#
#var orbit_points: Array[Vector3] = []
#var satellite: Node3D = null
#var time: float = 0.0
#
#func _ready():
	#generate_orbit()
	#place_satellite()
#
#func generate_orbit():
	#orbit_points.clear()
#
	#for i in range(orbit_resolution):
		## Угол (истинная аномалия)
		#var theta: float = deg_to_rad(i * 360.0 / orbit_resolution)
#
		## Радиус орбиты в зависимости от угла
		#var r: float = semi_major_axis * (1 - eccentricity * eccentricity) / (1 + eccentricity * cos(theta))
#
		## Положение точки в плоскости орбиты
		#var x: float = r * cos(theta)
		#var y: float = r * sin(theta)
		#var z: float = 0.0
#
		## Применяем наклонение, долготу восходящего узла и аргумент перицентра
		#var point: Vector3 = Vector3(x, y, z)
		#point = apply_orbital_parameters(point)
#
		#orbit_points.append(point)
#
	## Добавляем первую точку в конец, чтобы замкнуть орбиту
	#orbit_points.append(orbit_points[0])
#
	## Визуализация орбиты
	#draw_orbit()
#
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
#func draw_orbit():
	#var immediate_mesh: ImmediateMesh = ImmediateMesh.new()
	#var mesh_instance: MeshInstance3D = MeshInstance3D.new()
	#mesh_instance.mesh = immediate_mesh
	#add_child(mesh_instance)
#
	#var material: StandardMaterial3D = StandardMaterial3D.new()
	#material.albedo_color = orbit_color
	#material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
#
	#immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINE_STRIP, material)
#
	#for point in orbit_points:
		#immediate_mesh.surface_add_vertex(point)
#
	#immediate_mesh.surface_end()
#
#func place_satellite():
	#if satellite_scene == null:
		#return
#
	#satellite = satellite_scene.instantiate()
	#add_child(satellite)
#
	## Размещаем спутник в начальной точке орбиты
	#update_satellite_position(0.0)
#
#func update_satellite_position(time: float):
	#if satellite == null:
		#return
#
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
	#satellite.global_transform.origin = position
#
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
## Визуализация орбиты
#@export var orbit_resolution: int = 100    # Количество точек для отрисовки орбиты
#@export var orbit_color: Color = Color(1, 0, 0)    # Цвет орбиты
#
## Параметры спутника
#@export var satellite_scene: PackedScene    # Сцена спутника
#@export var orbital_period: float = 594.0    # Период обращения спутника (в секундах)
#
#var orbit_points: Array[Vector3] = []
#var satellite: Node3D = null
#var time: float = 0.0
#
#func _ready():
	#generate_orbit()
	#place_satellite()
#
## Генерация точек орбиты
#func generate_orbit():
	#orbit_points.clear()
#
	#for i in range(orbit_resolution):
		## Угол (истинная аномалия)
		#var theta: float = deg_to_rad(i * 360.0 / orbit_resolution)
#
		## Радиус орбиты в зависимости от угла
		#var r: float = semi_major_axis * (1 - eccentricity * eccentricity) / (1 + eccentricity * cos(theta))
#
		## Положение точки в плоскости орбиты
		#var x: float = r * cos(theta)
		#var y: float = r * sin(theta)
		#var z: float = 0.0
#
		## Применяем наклонение, долготу восходящего узла и аргумент перицентра
		#var point: Vector3 = apply_orbital_parameters(Vector3(x, y, z))
		#orbit_points.append(point)
#
	## Добавляем первую точку в конец, чтобы замкнуть орбиту
	#orbit_points.append(orbit_points[0])
#
	## Визуализация орбиты
	#draw_orbit()
#
## Применение параметров орбиты к точке
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
## Отрисовка орбиты
#func draw_orbit():
	#var immediate_mesh: ImmediateMesh = ImmediateMesh.new()
	#var mesh_instance: MeshInstance3D = MeshInstance3D.new()
	#mesh_instance.mesh = immediate_mesh
	#add_child(mesh_instance)
#
	#var material: StandardMaterial3D = StandardMaterial3D.new()
	#material.albedo_color = orbit_color
	#material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
#
	#immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINE_STRIP, material)
#
	#for point in orbit_points:
		#immediate_mesh.surface_add_vertex(point)
#
	#immediate_mesh.surface_end()
#
## Размещение спутника на орбите
#func place_satellite():
	#if satellite_scene == null:
		#return
#
	#satellite = satellite_scene.instantiate()
	#add_child(satellite)
#
	## Размещаем спутник в начальной точке орбиты
	#update_satellite_position(0.0)
#
## Обновление положения спутника
#func update_satellite_position(time: float):
	#if satellite == null:
		#return
#
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
	#satellite.global_transform.origin = position
#
## Обновление параметров орбиты
#func update_orbit_parameters(new_semi_major_axis: float, new_eccentricity: float, new_inclination: float, new_longitude_of_ascending_node: float, new_argument_of_periapsis: float):
	#semi_major_axis = new_semi_major_axis
	#eccentricity = new_eccentricity
	#inclination = new_inclination
	#longitude_of_ascending_node = new_longitude_of_ascending_node
	#argument_of_periapsis = new_argument_of_periapsis
#
	## Пересчитываем орбиту и обновляем спутник
	#generate_orbit()
	#update_satellite_position(time)
#
#func _process(delta: float):
	#time += delta
	#update_satellite_position(time)



extends Node3D

# Параметры орбиты
@export var semi_major_axis: float = 1000.0    # Большая полуось
@export var eccentricity: float = 0.001         # Эксцентриситет
@export var inclination: float = 98.18         # Наклонение (в градусах)
@export var longitude_of_ascending_node: float = 30.0    # Долгота восходящего узла (в градусах)
@export var argument_of_periapsis: float = 90.0                # Аргумент перицентра (в градусах)

# Визуализация орбиты
@export var orbit_resolution: int = 100    # Количество точек для отрисовки орбиты
@export var orbit_color: Color = Color(1, 0, 0)    # Цвет орбиты

# Параметры спутника
@export var orbital_period: float = 594.0    # Период обращения спутника (в секундах)

var orbit_points: Array[Vector3] = []
var time: float = 0.0

func _ready():
	generate_orbit()

func generate_orbit():
	orbit_points.clear()

	for i in range(orbit_resolution):
		# Угол (истинная аномалия)
		var theta: float = deg_to_rad(i * 360.0 / orbit_resolution)

		# Радиус орбиты в зависимости от угла
		var r: float = semi_major_axis * (1 - eccentricity * eccentricity) / (1 + eccentricity * cos(theta))

		# Положение точки в плоскости орбиты
		var x: float = r * cos(theta)
		var y: float = r * sin(theta)
		var z: float = 0.0

		# Применяем наклонение, долготу восходящего узла и аргумент перицентра
		var point: Vector3 = Vector3(x, y, z)
		point = apply_orbital_parameters(point)

		orbit_points.append(point)

	# Добавляем первую точку в конец, чтобы замкнуть орбиту
	orbit_points.append(orbit_points[0])

	# Визуализация орбиты
	draw_orbit()

func apply_orbital_parameters(point: Vector3) -> Vector3:
	# Применяем аргумент перицентра (вращение вокруг оси Z)
	point = point.rotated(Vector3.FORWARD, deg_to_rad(argument_of_periapsis))

	# Применяем наклонение (вращение вокруг оси X)
	point = point.rotated(Vector3.RIGHT, deg_to_rad(inclination))

	# Применяем долготу восходящего узла (вращение вокруг оси Y)
	point = point.rotated(Vector3.UP, deg_to_rad(longitude_of_ascending_node))

	return point

func draw_orbit():
	var immediate_mesh: ImmediateMesh = ImmediateMesh.new()
	var mesh_instance: MeshInstance3D = MeshInstance3D.new()
	mesh_instance.mesh = immediate_mesh
	add_child(mesh_instance)

	var material: StandardMaterial3D = StandardMaterial3D.new()
	material.albedo_color = orbit_color
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED

	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINE_STRIP, material)

	for point in orbit_points:
		immediate_mesh.surface_add_vertex(point)

	immediate_mesh.surface_end()

# Эта функция будет вызываться для обновления положения спутника
func update_satellite_position(time: float):
	var satellite = get_node("corpus_16") # Ссылаемся на дочерний объект "Satellite"
	
	if satellite == null:
		return

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

	# Обновляем позицию спутника относительно родительского объекта (орбиты)
	satellite.position = position

func _process(delta: float):
	time += delta
	update_satellite_position(time)
