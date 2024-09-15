class_name GodotXRTrackerStreamer
extends Node


## Tracker Streamer
##
## This node stream XR trackers from an avatar.


## Skeleton node
@export var skeleton : Skeleton3D

## Face node
@export var face : MeshInstance3D

## Optional origin node
@export var origin : Node3D

## Body Tracker Name
@export var body_tracker_name : StringName = &"/streaming/body_tracker"

## Face Tracker Name
@export var face_tracker_name : StringName = &"/streaming/face_tracker"

## Left Hand Tracker Name
@export var left_hand_tracker_name : StringName = &"/streaming/hand_tracker/left"

## Right Hand Tracker Name
@export var right_hand_tracker_name : StringName = &"/streaming/hand_tracker/right"

## Body flags
@export_flags("Upper Body", "Lower Body", "Hands") var body_flags : int = 7

## Automatically start streaming
@export var auto_start : bool = true


# Body tracker instance
var _body_tracker : XRBodyTracker

# Face tracker instance
var _face_tracker : XRFaceTracker

# Left hand tracker instance
var _left_hand_tracker : XRHandTracker

# Right hand tracker instance
var _right_hand_tracker : XRHandTracker

# Streaming flag
var _streaming : bool = false

# Dictionary of XRBodyTracker.Joint to skeleton bone-index
var _body_joints : Dictionary = {}

# Dictionary of XRFaceTracker.BlendShapeEntry to face blend-shape
var _face_blends : Dictionary = {}

# Dictionary of XRHandTracker.HandJoint to skeleton bone-index
var _left_hand_joints : Dictionary = {}

# Dictionary of XRHandTracker.HandJoint to skeleton bone-index
var _right_hand_joints : Dictionary = {}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Skip if in editor
	if Engine.is_editor_hint():
		return

	# Auto-start if requested
	if auto_start:
		start_streaming()


# Called every frame
func _process(_delta: float) -> void:
	# Disable if not streaming
	if not _streaming:
		set_process(false)
		return

	# This is only called if we have no skeleton, so stream the face
	_stream_face()


## This method starts streaming the avatar to trackers
func start_streaming() -> void:
	# Skip if no skeleton or face
	if not skeleton and not face:
		push_warning("GodotXRTrackerStreamer: nothing to stream")
		return

	# Add the body tracker if specified
	if body_tracker_name != &"" and skeleton:
		# Get the body joints
		_body_joints = GodotXRBodyData.get_joint_bones(
			skeleton,
			GodotXRBodyData.BODY_BONES)
		if _body_joints.size():
			_body_tracker = XRBodyTracker.new()
			_body_tracker.name = body_tracker_name
			_body_tracker.body_flags = body_flags
			XRServer.add_tracker(_body_tracker)

	# Add the face tracker if specified
	if face_tracker_name != &"" and face:
		_face_blends = GodotXRBodyData.get_face_blends(face)
		if _face_blends.size():
			_face_tracker = XRFaceTracker.new()
			_face_tracker.name = face_tracker_name
			XRServer.add_tracker(_face_tracker)

	# Add the left hand tracker if specified
	if left_hand_tracker_name != &"" and skeleton:
		_left_hand_joints = GodotXRBodyData.get_joint_bones(
			skeleton,
			GodotXRBodyData.LEFT_HAND_BONES)
		if _left_hand_joints.has(XRHandTracker.HAND_JOINT_WRIST):
			_left_hand_tracker = XRHandTracker.new()
			_left_hand_tracker.name = left_hand_tracker_name
			_left_hand_tracker.hand = XRPositionalTracker.TRACKER_HAND_LEFT
			XRServer.add_tracker(_left_hand_tracker)

	# Add the right hand tracker if specified
	if right_hand_tracker_name != &"" and skeleton:
		_right_hand_joints = GodotXRBodyData.get_joint_bones(
			skeleton,
			GodotXRBodyData.RIGHT_HAND_BONES)
		if _right_hand_joints.has(XRHandTracker.HAND_JOINT_WRIST):
			_right_hand_tracker = XRHandTracker.new()
			_right_hand_tracker.name = right_hand_tracker_name
			_right_hand_tracker.hand = XRPositionalTracker.TRACKER_HAND_RIGHT
			XRServer.add_tracker(_right_hand_tracker)

	# Set streaming
	_streaming = true
	if skeleton:
		# Stream on skeleton updates
		skeleton.skeleton_updated.connect(_on_skeleton_updated)
	else:
		# Stream on processing
		set_process(true)


## This method stops streaming the avatar to trackers.
func stop_streaming() -> void:
	# Stop streaming
	_streaming = false
	if skeleton:
		skeleton.skeleton_updated.disconnect(_on_skeleton_updated)

	# Remove any trackers
	if _body_tracker: XRServer.remove_tracker(_body_tracker)
	if _face_tracker: XRServer.remove_tracker(_face_tracker)
	if _left_hand_tracker: XRServer.remove_tracker(_left_hand_tracker)
	if _right_hand_tracker: XRServer.remove_tracker(_right_hand_tracker)

	# Clear trackers
	_body_tracker = null
	_face_tracker = null
	_left_hand_tracker = null
	_right_hand_tracker = null


# Handle updated skeleton
func _on_skeleton_updated() -> void:
	# Skip if not streaming
	if not _streaming:
		return

	# Get the origin
	var root : Transform3D
	if origin:
		root = origin.global_transform.affine_inverse() * skeleton.global_transform
	else:
		root = skeleton.transform

	# Update the body tracker
	if _body_tracker:
		# Update the tracking data
		for xr_joint in XRBodyTracker.JOINT_MAX:
			var bone := _body_joints.get(xr_joint, -1)

			# Set joint
			if xr_joint == XRBodyTracker.JOINT_ROOT:
				# Always set root joint
				var root_xform := root
				if bone >= 0:
					root_xform *= skeleton.get_bone_pose(bone)
				_body_tracker.set_joint_transform(xr_joint, root)
				_body_tracker.set_joint_flags(xr_joint, 15)
			elif bone >= 0:
				# Set normal joint
				_body_tracker.set_joint_transform(xr_joint,
					skeleton.get_bone_global_pose(bone).orthonormalized())
				_body_tracker.set_joint_flags(xr_joint, 15)
			else:
				# Joint not driven
				_body_tracker.set_joint_flags(xr_joint, 0)

		# Report tracking data present
		_body_tracker.set_pose(
			&"default",
			root,
			Vector3.ZERO,
			Vector3.ZERO,
			XRPose.XR_TRACKING_CONFIDENCE_HIGH)
		_body_tracker.has_tracking_data = true

	# Update the left-hand tracker
	if _left_hand_tracker:
		var wrist_bone : int = _left_hand_joints[XRHandTracker.HAND_JOINT_WRIST]
		var wrist_xform := skeleton.get_bone_global_pose(wrist_bone)
		var wrist_iform := wrist_xform.affine_inverse()

		# Update the tracking data
		for xr_joint in XRHandTracker.HAND_JOINT_MAX:
			var bone : int = _left_hand_joints.get(xr_joint, -1)
			if bone < 0:
				_left_hand_tracker.set_hand_joint_flags(xr_joint, 0)
			else:
				_left_hand_tracker.set_hand_joint_transform(xr_joint,
					wrist_iform * skeleton.get_bone_global_pose(bone))
				_left_hand_tracker.set_hand_joint_flags(xr_joint, 15)

		# Report tracking data present
		_left_hand_tracker.set_pose(
			&"default",
			root * wrist_xform,
			Vector3.ZERO,
			Vector3.ZERO,
			XRPose.XR_TRACKING_CONFIDENCE_HIGH)
		_left_hand_tracker.has_tracking_data = true

	# Update the right-hand tracker
	if _right_hand_tracker:
		var wrist_bone : int = _left_hand_joints[XRHandTracker.HAND_JOINT_WRIST]
		var wrist_xform := skeleton.get_bone_global_pose(wrist_bone)
		var wrist_iform := wrist_xform.affine_inverse()

		# Update the tracking data
		for xr_joint in XRHandTracker.HAND_JOINT_MAX:
			var bone := _right_hand_joints.get(xr_joint, -1)
			if bone < 0:
				_right_hand_tracker.set_hand_joint_flags(xr_joint, 0)
			else:
				_right_hand_tracker.set_hand_joint_transform(xr_joint,
					wrist_iform * skeleton.get_bone_global_pose(bone))
				_right_hand_tracker.set_hand_joint_flags(xr_joint, 15)

		# Report tracking data present
		_left_hand_tracker.set_pose(
			&"default",
			root * wrist_xform,
			Vector3.ZERO,
			Vector3.ZERO,
			XRPose.XR_TRACKING_CONFIDENCE_HIGH)
		_right_hand_tracker.has_tracking_data = true

	# If the face is enabled then stream it
	if _face_tracker:
		_stream_face()


# Update the face tracker
func _stream_face() -> void:
	# Update the blends
	for xr_blend in _face_blends:
		var blend : int = _face_blends[xr_blend]
		var weight := face.get_blend_shape_value(blend)
		_face_tracker.set_blend_shape(xr_blend, weight)
