class_name GodotXRAudioRecorder
extends Node


## Audio Recorder
##
## This node is capable of recording audio from an audio bus driven by
## a Microphone audio-stream player.


## Input audio bus name
@export var input_bus_name : String = "Input"


## Recorded Audio Stream
var audio : AudioStreamWAV


# Recorder
var _recorder : AudioEffectRecord


## Start the audio recording
func start_recording() -> bool:
	# Clear any current audio
	audio = null

	# Find the audio bus
	var bus_idx := AudioServer.get_bus_index(input_bus_name)
	if bus_idx == -1:
		push_warning("No input audio bus: ", input_bus_name)
		return false

	# Find the recorder effect
	for i in AudioServer.get_bus_effect_count(bus_idx):
		_recorder = AudioServer.get_bus_effect(bus_idx, i) as AudioEffectRecord
		if _recorder:
			break

	# Warn if no recorder
	if not _recorder:
		push_warning("No Record effect on audio bus: ", input_bus_name)
		return false

	# Start recording
	_recorder.set_recording_active(true)
	return true


## Stop the audio recording
func stop_recording() -> bool:
	# Fail if no recorder
	if not _recorder:
		return false

	# Save the recording and return success
	_recorder.set_recording_active(false)
	audio = _recorder.get_recording()
	_recorder = null
	return true
