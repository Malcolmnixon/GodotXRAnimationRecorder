class_name GodotXRBodyTrackerRecording
extends Resource


## Body Tracker Recording Resource
##
## This resource efficiently contains recordings of XRBodyTracker data.


## Array of joint names by index
@export var joints : PackedStringArray

## Recording length
@export var length : float

## Array of recorded timestamps
@export var times : Array[float] = []

## Array of tracker positions
@export var positions : Array[Vector3] = []

## Array of tracker rotations
@export var rotations : Array[Quaternion] = []

## Array of recorded body_flags
@export var body_flags : Array[int] = []

## Array of recorded joint flags
@export var joint_flags : Array[PackedInt32Array] = []

## Array of recorded joint transforms
@export var joint_origins : Array[PackedVector3Array] = []

## Array of recorded joint rotations
@export var joint_rotations : Array[PackedVector4Array] = []


# Initializes an instance of this class
func _init() -> void:
	joints = ClassDB.class_get_enum_constants("XRBodyTracker", "Joint")


## Clear the recording
func clear() -> void:
	times.clear()
	positions.clear()
	rotations.clear()
	body_flags.clear()
	joint_flags.clear()
	joint_origins.clear()
	joint_rotations.clear()


## Record tracker to the recording
func record(p_time : float, p_tracker : XRBodyTracker) -> void:
	# Append the time
	times.append(p_time)
	length = p_time

	# Save the body pose
	var bx := p_tracker.get_pose("default").transform
	positions.append(bx.origin)
	rotations.append(bx.basis.get_rotation_quaternion())

	# Append the body flags
	body_flags.append(p_tracker.body_flags)

	# Construct the packed arrays
	var packed_joint_flags := PackedInt32Array()
	var packed_joint_origins := PackedVector3Array()
	var packed_joint_rotations := PackedVector4Array()
	packed_joint_flags.resize(XRBodyTracker.JOINT_MAX)
	packed_joint_origins.resize(XRBodyTracker.JOINT_MAX)
	packed_joint_rotations.resize(XRBodyTracker.JOINT_MAX)

	# Populate the packed arrays
	for j in XRBodyTracker.JOINT_MAX:
		# Save the joint flags
		packed_joint_flags[j] = p_tracker.get_joint_flags(j)

		# Save the joint transform
		var jx := p_tracker.get_joint_transform(j)
		var jq := jx.basis.get_rotation_quaternion()
		packed_joint_origins[j] = jx.origin
		packed_joint_rotations[j] = Vector4(jq.x, jq.y, jq.z, jq.w)

	# Append the packed arrays
	joint_flags.append(packed_joint_flags)
	joint_origins.append(packed_joint_origins)
	joint_rotations.append(packed_joint_rotations)


## Find the best index for the specified time
func find(p_time : float) -> int:
	# Get the size
	var size := times.size()
	if size == 0:
		push_error("Empty BodyTrackerRecording")
		return -1

	# Return the best index
	return clampi(times.bsearch(p_time), 0, size - 1)


## Read tracking data from the recording
func read(p_index : int, p_tracker : XRBodyTracker) -> void:
	# Populate the body flags
	p_tracker.body_flags = body_flags[p_index]

	# Set the body pose
	var bo := positions[p_index]
	var bq := rotations[p_index]
	var bx := Transform3D(Basis(bq), bo)
	p_tracker.set_pose(
		"default",
		bx,
		Vector3.ZERO,
		Vector3.ZERO,
		XRPose.XR_TRACKING_CONFIDENCE_HIGH)

	# Get the packed arrays
	var packed_joint_flags := joint_flags[p_index]
	var packed_joint_origins := joint_origins[p_index]
	var packed_joint_rotations := joint_rotations[p_index]

	# Populate the joints
	for j in XRBodyTracker.JOINT_MAX:
		# Populate the joint flags
		p_tracker.set_joint_flags(j, packed_joint_flags[j])

		# Populate the joint transform
		var jo := packed_joint_origins[j]
		var jq := packed_joint_rotations[j]
		var jx := Transform3D(Basis(Quaternion(jq.x, jq.y, jq.z, jq.w)), jo)
		p_tracker.set_joint_transform(j, jx)

	# Report tracking data available
	p_tracker.has_tracking_data = true


## Play the recording at the specified time
func play(p_time : float, p_tracker : XRBodyTracker) -> void:
	read(find(p_time), p_tracker)
