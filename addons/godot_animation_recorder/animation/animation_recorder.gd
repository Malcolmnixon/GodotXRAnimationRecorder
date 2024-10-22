class_name GodotXRAnimationRecorder
extends Node


## Animation Recorder
##
## This node is capable of generating a Godot Animation by monitoring
## an avatar and inspecting the bones and facial blend-shapes.


## Skeleton node
@export var skeleton : Skeleton3D

## Face node
@export var face : MeshInstance3D

## Optional root-motion node
@export var root_motion : Node3D

## Only record 52 blend-shapes
@export var only_52_blendshapes : bool = true

## Only record godot-humanoid bones
@export var only_godot_humanoid_bones : bool = true

## Optimize recording
@export var optimize : bool = true


## Recorded animation
var animation : Animation


# Recording flag
var _recording : bool = false

# Recording start time
var _start : float

# Map of position-track to skeleton bone-index
var _bone_position_tracks : Dictionary

# Map of rotation-track to skeleton bone-index
var _bone_rotation_tracks : Dictionary

# Map of blend-shape-track to face blend-shape
var _face_tracks : Dictionary


## Start recording
func start_recording() -> bool:
	# Clear old recording
	_recording = false
	animation = null

	# Fail if no skeleton or face
	if not skeleton or not face:
		push_warning("Attempt to record with missing nodes")
		return false

	# Construct the animation
	animation = Animation.new()
	_bone_position_tracks = {}
	_bone_rotation_tracks = {}
	_face_tracks = {}

	# Set the animation rate
	match skeleton.modifier_callback_mode_process:
		Skeleton3D.ModifierCallbackModeProcess.MODIFIER_CALLBACK_MODE_PROCESS_PHYSICS:
			animation.step = 1 / Engine.physics_ticks_per_second

		Skeleton3D.ModifierCallbackModeProcess.MODIFIER_CALLBACK_MODE_PROCESS_IDLE:
			animation.step = 1 / Engine.get_frames_per_second()

	# Populate the tracks
	_populate_skeleton_tracks()
	_populate_face_tracks()

	# Start the recording
	print_verbose("GodotXRAnimationRecorder: Starting recording")
	skeleton.skeleton_updated.connect(_on_skeleton_updated)
	_start = _now()
	_recording = true
	return true


## Stop recording
func stop_recording() -> bool:
	# Skip if not recording
	if not _recording:
		return false

	# Stop the recording
	print_verbose("GodotXRAnimationRecorder: Stopping recording")
	_recording = false
	skeleton.skeleton_updated.disconnect(_on_skeleton_updated)

	# Optimize if requested
	if optimize:
		if animation.has_method("optimize"):
			print_verbose("GodotXRAnimationRecorder: Optimizing animation")
			animation.optimize(0.01, 0.01, 3)
		else:
			push_warning("Animation.optimize not supported")

	# Return success
	return true


func _on_skeleton_updated() -> void:
	# Calculate the recording time
	var time := _now() - _start

	# Update the animation length
	animation.length = time

	# Record bone positions
	for track in _bone_position_tracks:
		var bone : int = _bone_position_tracks[track]
		var pos := skeleton.get_bone_pose_position(bone)
		# Apply optional root motion
		if root_motion and skeleton.get_bone_parent(bone) == -1:
			pos = root_motion.transform * pos
		animation.track_insert_key(track, time, pos)

	# Record bone rotations
	for track in _bone_rotation_tracks:
		var bone : int = _bone_rotation_tracks[track]
		var rot := skeleton.get_bone_pose_rotation(bone)
		animation.track_insert_key(track, time, rot)

	# Record face blend-shapes
	for track in _face_tracks:
		var blend : int = _face_tracks[track]
		var weight := face.get_blend_shape_value(blend)
		animation.track_insert_key(track, time, weight)


# Populate the skeleton tracks
func _populate_skeleton_tracks() -> void:
	# Iterate over all bones
	for b in skeleton.get_bone_count():
		# Get the bone name and path
		var bone_name := skeleton.get_bone_name(b)
		var path := NodePath("%GeneralSkeleton:" + bone_name)

		# Skip if only humanoid bones and this isn't a humanoid bone
		if only_godot_humanoid_bones and not GodotXRBodyData.is_body_bone(bone_name):
			continue

		# Add position tracks for root bones and hips
		if skeleton.get_bone_parent(b) == -1 or bone_name == "Hips":
			var pos_track := animation.add_track(Animation.TYPE_POSITION_3D)
			animation.track_set_interpolation_type(pos_track, Animation.INTERPOLATION_LINEAR)
			animation.track_set_path(pos_track, path)
			_bone_position_tracks[pos_track] = b

		# Add rotation tracks
		var rot_track := animation.add_track(Animation.TYPE_ROTATION_3D)
		animation.track_set_interpolation_type(rot_track, Animation.INTERPOLATION_LINEAR_ANGLE)
		animation.track_set_path(rot_track, path)
		_bone_rotation_tracks[rot_track] = b


# Populate the face tracks
func _populate_face_tracks() -> void:
	# Get the animation node path
	var node_path := skeleton.get_parent().get_path_to(face)

	# Iterate over all blend-shapes
	for b in face.get_blend_shape_count():
		# Get the blend-shape name and path
		var blend_name : String = face.mesh.get_blend_shape_name(b)
		var path := NodePath(String(node_path) + ":" + blend_name)

		# Skip if only 52 blend-shapes and this isn't a 52 blend-shape
		if only_52_blendshapes and not GodotXRBodyData.is_face_blend_52(blend_name):
			continue

		# Add the blend-shape track
		var blend_track := animation.add_track(Animation.TYPE_BLEND_SHAPE)
		animation.track_set_interpolation_type(blend_track, Animation.INTERPOLATION_LINEAR)
		animation.track_set_path(blend_track, path)
		_face_tracks[blend_track] = b


# Get a monotonic time in float seconds
static func _now() -> float:
	return Time.get_ticks_msec() * 0.001
