extends Node2D

export (PackedScene) var spawned_entity

const DEFAULT_SPAWNED_ENTITY = preload("res://Projectiles/EnemyProjectile.tscn")

onready var spawners = $SpawnerContainer.get_children()
onready var nb_spawners = spawners.size()

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	if !spawned_entity:
		spawned_entity = DEFAULT_SPAWNED_ENTITY
	for spawner in spawners:
		spawner.initialize(spawned_entity)

func _on_SpawnTimer_timeout():
	var spawner_index = randi() % nb_spawners
	spawners[spawner_index].spawn()