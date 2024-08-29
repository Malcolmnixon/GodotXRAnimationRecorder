class_name GodotXRFaceTrackerRecording
extends Resource


## Face Tracker Recording Resource
##
## This resource efficiently contains recordings of XRFaceTracker data.


## Array of blend shapes names by index
@export var blends : PackedStringArray

## Array of recorded timestamps
@export var times : Array[float] = []

## Array of recorded blend shapes
@export var blend_shapes : Array[PackedFloat32Array] = []


# Initializes an instance of this class
func _init() -> void:
	blends = ClassDB.class_get_enum_constants("XRFaceTracker", "BlendShapeEntry")


## Clear the recording
func clear() -> void:
	times.clear()
	blend_shapes.clear()


## Record tracker to the recording
func record(p_time : float, p_tracker : XRFaceTracker) -> void:
	# Append the time
	times.append(p_time)

	# Append the blend shapes
	blend_shapes.append(p_tracker.blend_shapes)


## Find the best index for the specified time
func find(p_time : float) -> int:
	# Get the size
	var size := times.size()
	if size == 0:
		push_error("Empty FaceTrackerRecording")
		return -1

	# Return the best index
	return clampi(times.bsearch(p_time), 0, size - 1)


## Read tracking data from the recording
func read(p_index : int, p_tracker : XRFaceTracker) -> void:
	# Populate the blend shapes
	p_tracker.blend_shapes = blend_shapes[p_index]


## Play the recording at the specified time
func play(p_time : float, p_tracker : XRFaceTracker) -> void:
	read(find(p_time), p_tracker)
