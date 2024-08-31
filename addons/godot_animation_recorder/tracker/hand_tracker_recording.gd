class_name GodotXRHandTrackerRecording
extends Resource


## Hand Tracker Recording Resource
##
## This resource efficiently contains recordings of XRHandTracker data.


## Array of joint names by index
@export var joints : PackedStringArray

## Recording length
@export var length : float

## Array of recorded timestamps
@export var times : Array[float] = []

## Array of recorded joint flags
@export var joint_flags : Array[PackedInt32Array] = []

## Array of recorded joint transforms
@export var joint_origins : Array[PackedVector3Array] = []

## Array of recorded joint rotations
@export var joint_rotations : Array[PackedVector4Array] = []


# Initializes an instance of this class
func _init() -> void:
	joints = ClassDB.class_get_enum_constants("XRHandTracker", "HandJoint")


## Clear the recording
func clear() -> void:
	times.clear()
	joint_flags.clear()
	joint_origins.clear()
	joint_rotations.clear()


## Record tracker to the recording
func record(p_time : float, p_tracker : XRHandTracker) -> void:
	# Append the time
	times.append(p_time)
	length = p_time

	# Construct the packed arrays
	var packed_joint_flags := PackedInt32Array()
	var packed_joint_origins := PackedVector3Array()
	var packed_joint_rotations := PackedVector4Array()
	packed_joint_flags.resize(XRBodyTracker.JOINT_MAX)
	packed_joint_origins.resize(XRBodyTracker.JOINT_MAX)
	packed_joint_rotations.resize(XRBodyTracker.JOINT_MAX)

	# Populate the packed arrays
	for j in XRHandTracker.HAND_JOINT_MAX:
		# Save the joint flags
		packed_joint_flags[j] = p_tracker.get_hand_joint_flags(j)

		# Save the joint transform
		var xform := p_tracker.get_hand_joint_transform(j)
		var o := xform.origin
		var q := xform.basis.get_rotation_quaternion()
		packed_joint_origins[j] = o
		packed_joint_rotations[j] = Vector4(q.x, q.y, q.z, q.w)

	# Append the packed arrays
	joint_flags.append(packed_joint_flags)
	joint_origins.append(packed_joint_origins)
	joint_rotations.append(packed_joint_rotations)


## Find the best index for the specified time
func find(p_time : float) -> int:
	# Get the size
	var size := times.size()
	if size == 0:
		push_error("Empty HandTrackerRecording")
		return -1

	# Return the best index
	return clampi(times.bsearch(p_time), 0, size - 1)


## Read tracking data from the recording
func read(p_index : int, p_tracker : XRHandTracker) -> void:
	# Get the packed arrays
	var packed_joint_flags := joint_flags[p_index]
	var packed_joint_origins := joint_origins[p_index]
	var packed_joint_rotations := joint_rotations[p_index]

	# Populate the joints
	for j in XRHandTracker.HAND_JOINT_MAX:
		# Populate the joint flags
		p_tracker.set_hand_joint_flags(j, packed_joint_flags[j])

		# Populate the joint transform
		var o := packed_joint_origins[j]
		var q := packed_joint_rotations[j]
		var xform := Transform3D(Basis(Quaternion(q.x, q.y, q.z, q.w)), o)
		p_tracker.set_hand_joint_transform(j, xform)

	# Report tracking data available
	p_tracker.has_tracking_data = true


## Play the recording at the specified time
func play(p_time : float, p_tracker : XRHandTracker) -> void:
	read(find(p_time), p_tracker)
