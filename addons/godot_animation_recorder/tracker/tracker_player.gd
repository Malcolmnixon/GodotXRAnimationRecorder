class_name GodotXRTrackerPlayer
extends Node


## Tracker Recorder
##
## This node is capable of playing recording trackers.


## Body Tracker Name
@export var body_tracker_name : StringName = &"/recording/body_tracker"

## Face Tracker Name
@export var face_tracker_name : StringName = &"/recording/face_tracker"

## Left Hand Tracker Name
@export var left_hand_tracker_name : StringName = &"/recording/hand_tracker/left"

## Right Hand Tracker Name
@export var right_hand_tracker_name : StringName = &"/recording/hand_tracker/right"

## Body Recording
@export var body_recording : GodotXRBodyTrackerRecording

## Face Recording
@export var face_recording : GodotXRFaceTrackerRecording

## Left Hand Recording
@export var left_hand_recording : GodotXRHandTrackerRecording

## Right Hand Recording
@export var right_hand_recording : GodotXRHandTrackerRecording


# Playing flag
var _playing : bool = false

# Playing start time
var _start : float

# Body tracker instance
var _body_tracker : XRBodyTracker

# Face tracker instance
var _face_tracker : XRFaceTracker

# Left hand tracker instance
var _left_hand_tracker : XRHandTracker

# Right hand tracker instance
var _right_hand_tracker : XRHandTracker


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Disable if not playing
	if not _playing:
		set_physics_process(false)
		return

	# Calculate the recording time
	var time := _now() - _start

	# Play the recordings
	if _body_tracker: body_recording.play(time, _body_tracker)
	if _face_tracker: face_recording.play(time, _face_tracker)
	if _left_hand_tracker: left_hand_recording.play(time, _left_hand_tracker)
	if _right_hand_tracker: right_hand_recording.play(time, _right_hand_tracker)


func play() -> void:
	# Ensure any existing playback is stopped
	stop()

	# Add the body tracker if specified
	if body_tracker_name != &"" and body_recording:
		_body_tracker = XRBodyTracker.new()
		_body_tracker.name = body_tracker_name
		XRServer.add_tracker(_body_tracker)

	# Add the face tracker if specified
	if face_tracker_name != &"" and face_recording:
		_face_tracker = XRFaceTracker.new()
		_face_tracker.name = face_tracker_name
		XRServer.add_tracker(_face_tracker)

	# Add the left hand tracker if specified
	if left_hand_tracker_name != &"" and left_hand_recording:
		_left_hand_tracker = XRHandTracker.new()
		_left_hand_tracker.name = left_hand_tracker_name
		XRServer.add_tracker(_left_hand_tracker)

	# Add the right hand tracker if specified
	if right_hand_tracker_name != &"" and right_hand_recording:
		_right_hand_tracker = XRHandTracker.new()
		_right_hand_tracker.name = right_hand_tracker_name
		XRServer.add_tracker(_right_hand_tracker)

	# Start playing
	_start = _now()
	_playing = true
	set_physics_process(true)


## Stop playback
func stop() -> void:
	# Clear playing
	_playing = false

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


# Get a monotonic time in float seconds
static func _now() -> float:
	return Time.get_ticks_msec() * 0.001
