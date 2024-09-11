class_name GodotXRTrackerRecorder
extends Node


## Tracker Recorder
##
## This node is capable of recording trackers.


## Body Tracker Name
@export var body_tracker_name : StringName = &"/user/body_tracker"

## Face Tracker Name
@export var face_tracker_name : StringName = &"/user/face_tracker"

## Left Hand Tracker Name
@export var left_hand_tracker_name : StringName = &"/user/hand_tracker/left"

## Right Hand Tracker Name
@export var right_hand_tracker_name : StringName = &"/user/hand_tracker/right"


## Body Recording
var body_recording : GodotXRBodyTrackerRecording

## Face Recording
var face_recording : GodotXRFaceTrackerRecording

## Left Hand Recording
var left_hand_recording : GodotXRHandTrackerRecording

## Right Hand Recording
var right_hand_recording : GodotXRHandTrackerRecording


# Recording flag
var _recording : bool = false

# Recording start time
var _start : float

# Body tracker instance
var _body_tracker : XRBodyTracker

# Face tracker instance
var _face_tracker : XRFaceTracker

# Left hand tracker instance
var _left_hand_tracker : XRHandTracker

# Right hand tracker instance
var _right_hand_tracker : XRHandTracker


# Called every physics frame to record tracking data
func _physics_process(_delta: float) -> void:
	# Disable if not recording
	if not _recording:
		set_physics_process(false)
		return

	# Calculate the recording time
	var time := _now() - _start

	# Record the trackers
	if _body_tracker: body_recording.record(time, _body_tracker)
	if _face_tracker: face_recording.record(time, _face_tracker)
	if _left_hand_tracker: left_hand_recording.record(time, _left_hand_tracker)
	if _right_hand_tracker: right_hand_recording.record(time, _right_hand_tracker)


## Start recording
func start_recording() -> void:
	# Clear the recordings
	body_recording = null
	face_recording = null
	left_hand_recording = null
	right_hand_recording = null

	# Get the trackers
	_body_tracker = XRServer.get_tracker(body_tracker_name)
	_face_tracker = XRServer.get_tracker(face_tracker_name)
	_left_hand_tracker = XRServer.get_tracker(left_hand_tracker_name)
	_right_hand_tracker = XRServer.get_tracker(right_hand_tracker_name)

	# Populate the recordings
	if _body_tracker: body_recording = GodotXRBodyTrackerRecording.new()
	if _face_tracker: face_recording = GodotXRFaceTrackerRecording.new()
	if _left_hand_tracker: left_hand_recording = GodotXRHandTrackerRecording.new()
	if _right_hand_tracker: right_hand_recording = GodotXRHandTrackerRecording.new()

	# Print verbose diagnostics
	print_verbose("GodotXRTrackerRecorder: Stopping recording...")
	if _body_tracker: print_verbose("  Recording body ", body_tracker_name)
	if _face_tracker: print_verbose("  Recording face ", face_tracker_name)
	if _left_hand_tracker: print_verbose("  Recording left hand ", left_hand_tracker_name)
	if _right_hand_tracker: print_verbose("  Recording right hand ", right_hand_tracker_name)

	# Start recording
	_start = _now()
	_recording = true
	set_physics_process(true)


## Stop recording
func stop_recording() -> void:
	# Skip if not recording
	if not _recording:
		return

	# Stop recording
	print_verbose("GodotXRTrackerRecorder: Stopping recording")
	_recording = false


# Get a monotonic time in float seconds
static func _now() -> float:
	return Time.get_ticks_msec() * 0.001
