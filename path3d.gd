extends Path3D

# Параметры орбиты
@export var semi_major_axis: float = 10.0
@export var eccentricity: float = 0.1
@export var inclination: float = 0.0
@export var argument_of_periapsis: float = 0.0
@export var longitude_of_ascending_node: float = 0.0

# Ссылка на Curve3D
@onready var orbit_curve: Curve3D = $Curve3D

func _ready() -> void:
	update_orbit()

# Обновление визуализации орбиты
func update_orbit() -> void:
	orbit_curve.clear_points()  # Очищаем предыдущие точки

	for i in range(100):
		var angle = 2 * PI * i / 100
		var radius = (semi_major_axis * (1 - pow(eccentricity, 2))) / (1 + eccentricity * cos(angle))
		var position_in_orbital_plane = Vector3(radius * cos(angle), 0, radius * sin(angle))

		var rotation_matrix = Basis().rotated(Vector3(1, 0, 0), inclination) * Basis().rotated(Vector3(0, 1, 0), argument_of_periapsis)
		var position = rotation_matrix * position_in_orbital_plane

		# Добавляем точку в кривую
		orbit_curve.add_point(position)

	# Замыкаем орбиту (соединяем последнюю точку с первой)
	orbit_curve.add_point(orbit_curve.get_point_position(0))

# В скрипте Path3D
@onready var path_mesh_instance: MeshInstance3D = $MeshInstance3D

func _ready() -> void:
	update_orbit()
	update_mesh()

# Обновление меша для отображения линии
func update_mesh() -> void:
	var curve_mesh = CylinderMesh.new()
	curve_mesh.curve = orbit_curve
	path_mesh_instance.mesh = curve_mesh
