#extends Node3D
#
## Параметры орбиты
#@export var semi_major_axis: float = 10.0
#@export var eccentricity: float = 0.1
#@export var inclination: float = 0.0
#@export var argument_of_periapsis: float = 0.0
#@export var longitude_of_ascending_node: float = 0.0
#
## Ссылка на ImmediateMesh
#@onready var orbit_mesh: ImmediateMesh = $MeshInstance3D.mesh
#
#func _ready() -> void:
	#update_orbit()
#
## Обновление визуализации орбиты
#func update_orbit() -> void:
	#orbit_mesh.clear_surfaces()  # Очищаем предыдущие данные
#
	## Начинаем создание новой поверхности
	#orbit_mesh.surface_begin(Mesh.PRIMITIVE_LINE_STRIP)
#
	#for i in range(100):
		#var angle = 2 * PI * i / 100
		#var radius = (semi_major_axis * (1 - pow(eccentricity, 2))) / (1 + eccentricity * cos(angle))
		#var position_in_orbital_plane = Vector3(radius * cos(angle), 0, radius * sin(angle))
#
		#var rotation_matrix = Basis().rotated(Vector3(1, 0, 0), inclination) * Basis().rotated(Vector3(0, 1, 0), argument_of_periapsis)
		#var position = rotation_matrix * position_in_orbital_plane
#
		## Добавляем точку в линию
		#orbit_mesh.surface_add_vertex(position)
#
	## Замыкаем орбиту (соединяем последнюю точку с первой)
	#var first_point = orbit_mesh.surface_get_vertex(0)
	#orbit_mesh.surface_add_vertex(first_point)
#
	## Завершаем создание поверхности
	#orbit_mesh.surface_end()


#extends Node3D
#
## Параметры орбиты
#@export var semi_major_axis: float = 10.0
#@export var eccentricity: float = 0.1
#@export var inclination: float = 0.0
#@export var argument_of_periapsis: float = 0.0
#@export var longitude_of_ascending_node: float = 0.0
#
## Ссылка на ImmediateMesh
#@onready var orbit_mesh: ImmediateMesh = $MeshInstance3D.mesh
#@export var orbit_color: Color = Color(1, 0, 0)    # Цвет орбиты
#
#func _ready() -> void:
	#update_orbit()
#
## Обновление визуализации орбиты
#func update_orbit() -> void:
	#orbit_mesh.clear_surfaces()  # Очищаем предыдущие данные
#
	## Начинаем создание новой поверхности
	#orbit_mesh.surface_begin(Mesh.PRIMITIVE_LINE_STRIP)
#
	#var first_point: Vector3 = Vector3()  # Сохраняем первую точку
#
	#for i in range(100):
		#var angle = 2 * PI * i / 100
		#var radius = (semi_major_axis * (1 - pow(eccentricity, 2))) / (1 + eccentricity * cos(angle))
		#var position_in_orbital_plane = Vector3(radius * cos(angle), 0, radius * sin(angle))
#
		#var rotation_matrix = Basis().rotated(Vector3(1, 0, 0), inclination) * Basis().rotated(Vector3(0, 1, 0), argument_of_periapsis)
		#var position = rotation_matrix * position_in_orbital_plane
#
		## Сохраняем первую точку
		#if i == 0:
			#first_point = position
#
		## Добавляем точку в линию
		#orbit_mesh.surface_add_vertex(position)
#
	## Замыкаем орбиту (соединяем последнюю точку с первой)
	#orbit_mesh.surface_add_vertex(first_point)
#
	## Завершаем создание поверхности
	#orbit_mesh.surface_end()


#extends Node3D
#
## Параметры орбиты
#@export var semi_major_axis: float = 10.0
#@export var eccentricity: float = 0.1
#@export var inclination: float = 0.0
#@export var argument_of_periapsis: float = 0.0
#@export var longitude_of_ascending_node: float = 0.0
#
## Ссылка на ImmediateMesh
#@onready var orbit_mesh: ImmediateMesh = $MeshInstance3D.mesh
#@export var orbit_color: Color = Color(1, 0, 0)  # Цвет орбиты
#
## Узел спутника
#@export var satellite: Node3D
#
#func _ready() -> void:
	#update_orbit()
#
## Обновление визуализации орбиты
#func update_orbit() -> void:
	#orbit_mesh.clear_surfaces()  # Очищаем предыдущие данные
#
	#var material: StandardMaterial3D = StandardMaterial3D.new()
	#material.albedo_color = orbit_color
	#material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
#
	## Начинаем создание новой поверхности
	#orbit_mesh.surface_begin(Mesh.PRIMITIVE_LINE_STRIP, material)
#
	#var first_point: Vector3 = Vector3()  # Сохраняем первую точку
#
	#for i in range(100):
		#var angle = 2 * PI * i / 100
		#var radius = (semi_major_axis * (1 - pow(eccentricity, 2))) / (1 + eccentricity * cos(angle))
		#var position_in_orbital_plane = Vector3(radius * cos(angle), 0, radius * sin(angle))
#
		#var rotation_matrix = Basis().rotated(Vector3(1, 0, 0), inclination) * Basis().rotated(Vector3(0, 1, 0), argument_of_periapsis) * Basis().rotated(Vector3(0, 0, 1), longitude_of_ascending_node)
#
		#var position = rotation_matrix * position_in_orbital_plane
#
		## Сохраняем первую точку
		#if i == 0:
			#first_point = position
#
		## Добавляем точку в линию
		#orbit_mesh.surface_add_vertex(position)
#
	## Замыкаем орбиту (соединяем последнюю точку с первой)
	#orbit_mesh.surface_add_vertex(first_point)
#
	## Завершаем создание поверхности
	#orbit_mesh.surface_end()
#
## Обновление положения спутника на орбите
#func update_satellite_position(time: float) -> void:
	#if satellite == null:
		#return
#
	#var angle = 2 * PI * time
	#var radius = (semi_major_axis * (1 - pow(eccentricity, 2))) / (1 + eccentricity * cos(angle))
	#var position_in_orbital_plane = Vector3(radius * cos(angle), 0, radius * sin(angle))
#
	#var rotation_matrix = Basis().rotated(Vector3(1, 0, 0), inclination) * Basis().rotated(Vector3(0, 1, 0), argument_of_periapsis) * Basis().rotated(Vector3(0, 0, 1), longitude_of_ascending_node)
#
	#var local_position = rotation_matrix * position_in_orbital_plane
	#satellite.global_position = global_transform.origin + global_transform.basis * local_position



#extends Node3D
#
## Параметры орбиты
#@export var semi_major_axis: float = 10.0
#@export var eccentricity: float = 0.1
#@export var inclination: float = 0.0
#@export var argument_of_periapsis: float = 0.0
#@export var longitude_of_ascending_node: float = 0.0
#
## Ссылка на ImmediateMesh
#@onready var orbit_mesh: ImmediateMesh = $MeshInstance3D.mesh
#@export var orbit_color: Color = Color(1, 0, 0)  # Цвет орбиты
#
## Узел спутника
#@export var satellite: Node3D
#
#func _ready() -> void:
	## Создаем материал с отключенным освещением
	#var material = StandardMaterial3D.new()
	#material.albedo_color = orbit_color
	#material.flags_unshaded = true  # Отключаем освещение
	#orbit_mesh.surface_set_material(0, material)
#
	#update_orbit()
#
## Обновление визуализации орбиты
#func update_orbit() -> void:
	#orbit_mesh.clear_surfaces()  # Очищаем предыдущие данные
#
	## Начинаем создание новой поверхности
	#orbit_mesh.surface_begin(Mesh.PRIMITIVE_LINE_STRIP)
#
	#var first_point: Vector3 = Vector3()  # Сохраняем первую точку
#
	#for i in range(100):
		#var angle = 2 * PI * i / 100
		#var radius = (semi_major_axis * (1 - pow(eccentricity, 2))) / (1 + eccentricity * cos(angle))
		#var position_in_orbital_plane = Vector3(radius * cos(angle), 0, radius * sin(angle))
#
		#var rotation_matrix = Basis().rotated(Vector3(1, 0, 0), inclination) * Basis().rotated(Vector3(0, 1, 0), argument_of_periapsis) * Basis().rotated(Vector3(0, 0, 1), longitude_of_ascending_node)
#
		#var position = rotation_matrix * position_in_orbital_plane
#
		## Сохраняем первую точку
		#if i == 0:
			#first_point = position
#
		## Добавляем точку в линию
		#orbit_mesh.surface_add_vertex(position)
#
	## Замыкаем орбиту (соединяем последнюю точку с первой)
	#orbit_mesh.surface_add_vertex(first_point)
#
	## Завершаем создание поверхности
	#orbit_mesh.surface_end()
#
## Обновление положения спутника на орбите
#func update_satellite_position(time: float) -> void:
	#if satellite == null:
		#return
#
	#var angle = 2 * PI * time
	#var radius = (semi_major_axis * (1 - pow(eccentricity, 2))) / (1 + eccentricity * cos(angle))
	#var position_in_orbital_plane = Vector3(radius * cos(angle), 0, radius * sin(angle))
#
	#var rotation_matrix = Basis().rotated(Vector3(1, 0, 0), inclination) * Basis().rotated(Vector3(0, 1, 0), argument_of_periapsis) * Basis().rotated(Vector3(0, 0, 1), longitude_of_ascending_node)
#
	#var local_position = rotation_matrix * position_in_orbital_plane
	#satellite.global_position = global_transform.origin + global_transform.basis * local_position
	
	

#extends Node3D
#
## Параметры орбиты
#@export var semi_major_axis: float = 10.0
#@export var eccentricity: float = 0.1
#@export var inclination: float = 0.0  # В градусах
#@export var argument_of_periapsis: float = 0.0  # В градусах
#@export var longitude_of_ascending_node: float = 0.0  # В градусах
#@export var orbit_resolution: int = 100  # Количество точек
#@export var orbit_color: Color = Color(1, 0, 0)  # Цвет орбиты
#
## Узел спутника
#@export var satellite: Node3D
#
## Переменные
#var orbit_points: Array[Vector3] = []
#
#func _ready() -> void:
	## Генерация орбиты
	#generate_orbit()
	#draw_orbit()
#
## Генерация точек орбиты
#func generate_orbit() -> void:
	#orbit_points.clear()
#
	#for i in range(orbit_resolution):
		#var theta: float = deg_to_rad(i * 360.0 / orbit_resolution)  # Истинная аномалия
		#var r: float = (semi_major_axis * (1 - pow(eccentricity, 2))) / (1 + eccentricity * cos(theta))
#
		## Положение точки в плоскости орбиты
		#var x: float = r * cos(theta)
		#var y: float = 0.0
		#var z: float = r * sin(theta)
#
		#var point = apply_orbital_parameters(Vector3(x, y, z))
		#orbit_points.append(point)
#
	## Замыкаем орбиту
	#orbit_points.append(orbit_points[0])
#
## Применение орбитальных параметров
#func apply_orbital_parameters(point: Vector3) -> Vector3:
	#point = point.rotated(Vector3.RIGHT, deg_to_rad(inclination))  # Наклонение
	#point = point.rotated(Vector3.FORWARD, deg_to_rad(argument_of_periapsis))  # Аргумент перицентра
	#point = point.rotated(Vector3.UP, deg_to_rad(longitude_of_ascending_node))  # Долгота восходящего узла
	#return point
#
## Визуализация орбиты
#func draw_orbit() -> void:
	#var immediate_mesh: ImmediateMesh = ImmediateMesh.new()
	#var mesh_instance: MeshInstance3D = MeshInstance3D.new()
	#mesh_instance.mesh = immediate_mesh
	#add_child(mesh_instance)
#
	## Создаём материал
	#var material: StandardMaterial3D = StandardMaterial3D.new()
	#material.albedo_color = orbit_color
	#material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
#
	## Начинаем создание линии
	#immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINE_STRIP, material)
#
	#for point in orbit_points:
		#immediate_mesh.surface_add_vertex(point)
#
	## Завершаем создание линии
	#immediate_mesh.surface_end()
#
## Обновление позиции спутника
#func update_satellite_position(time: float) -> void:
	#if satellite == null:
		#return
#
	## Вычисляем текущий угол (истинная аномалия)
	#var theta: float = fmod(time * 2 * PI, 2 * PI)
	#var r: float = (semi_major_axis * (1 - pow(eccentricity, 2))) / (1 + eccentricity * cos(theta))
#
	## Положение спутника в плоскости орбиты
	#var x: float = r * cos(theta)
	#var y: float = 0.0
	#var z: float = r * sin(theta)
#
	#var position = apply_orbital_parameters(Vector3(x, y, z))
	#satellite.global_position = global_transform.origin + position




extends Node3D

# Параметры орбиты
@export var semi_major_axis: float = 10.0
@export var eccentricity: float = 0.1
@export var inclination: float = 0.0  # В градусах
@export var argument_of_periapsis: float = 0.0  # В градусах
@export var longitude_of_ascending_node: float = 0.0  # В градусах
@export var orbit_color: Color = Color(1, 0, 0)  # Цвет орбиты
@export var orbit_resolution: int = 100  # Количество точек

# Массив точек орбиты
var orbit_points: Array[Vector3] = []

func _ready() -> void:
	# При создании узла автоматически обновляем орбиту
	update_orbit()

# Обновляет визуализацию орбиты
func update_orbit() -> void:
	generate_orbit()
	draw_orbit()

# Генерация точек орбиты
func generate_orbit() -> void:
	orbit_points.clear()

	for i in range(orbit_resolution):
		var theta: float = deg_to_rad(i * 360.0 / orbit_resolution)  # Истинная аномалия
		var r: float = (semi_major_axis * (1 - pow(eccentricity, 2))) / (1 + eccentricity * cos(theta))

		# Положение точки в плоскости орбиты
		var x: float = r * cos(theta)
		var y: float = 0.0
		var z: float = r * sin(theta)

		var point = apply_orbital_parameters(Vector3(x, y, z))
		orbit_points.append(point)

	# Замыкаем орбиту
	orbit_points.append(orbit_points[0])

# Применение орбитальных параметров (наклонение, долгота узла, аргумент перицентра)
func apply_orbital_parameters(point: Vector3) -> Vector3:
	point = point.rotated(Vector3.RIGHT, deg_to_rad(inclination))  # Наклонение
	point = point.rotated(Vector3.FORWARD, deg_to_rad(argument_of_periapsis))  # Аргумент перицентра
	point = point.rotated(Vector3.UP, deg_to_rad(longitude_of_ascending_node))  # Долгота восходящего узла
	return point

# Рендеринг орбиты с использованием ImmediateMesh
func draw_orbit() -> void:
	# Удаляем старые дочерние узлы с MeshInstance3D
	for child in get_children():
		if child is MeshInstance3D:
			child.queue_free()

	var immediate_mesh: ImmediateMesh = ImmediateMesh.new()
	var mesh_instance: MeshInstance3D = MeshInstance3D.new()
	mesh_instance.mesh = immediate_mesh
	add_child(mesh_instance)

	# Создаём материал
	var material: StandardMaterial3D = StandardMaterial3D.new()
	material.albedo_color = orbit_color
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED

	# Начинаем создание линии
	immediate_mesh.surface_begin(Mesh.PRIMITIVE_LINE_STRIP, material)

	for point in orbit_points:
		immediate_mesh.surface_add_vertex(point)

	# Завершаем создание линии
	immediate_mesh.surface_end()
