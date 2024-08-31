extends Node3D



var animation : Animation


# Process movement based on keyboard
func _process(delta : float) -> void:
	var xform : Transform3D = %Camera3D.global_transform

	# Handle normal W/A/S/D/Q/E buttons
	if Input.is_key_pressed(KEY_A):
		xform.origin -= xform.basis.x * delta * 2.0
	if Input.is_key_pressed(KEY_D):
		xform.origin += xform.basis.x * delta * 2.0
	if Input.is_key_pressed(KEY_W):
		xform.origin -= xform.basis.z * delta * 2.0
	if Input.is_key_pressed(KEY_S):
		xform.origin += xform.basis.z * delta * 2.0
	if Input.is_key_pressed(KEY_Q):
		xform.origin -= xform.basis.y * delta * 2.0
	if Input.is_key_pressed(KEY_E):
		xform.origin += xform.basis.y * delta * 2.0

	%Camera3D.global_transform = xform


# Process movement based on mouse events
func _input(event : InputEvent) -> void:
	var xform : Transform3D = %Camera3D.global_transform

	# Handle rotation by right-mouse-drag
	var motion := event as InputEventMouseMotion
	if motion and motion.button_mask & MOUSE_BUTTON_MASK_RIGHT:
		xform.basis = Basis(Vector3.UP, -motion.relative.x * 0.001) * xform.basis
		xform.basis = Basis(xform.basis.x, -motion.relative.y * 0.001) * xform.basis

	# Handle mouse capture and mouse-wheel movement in/out
	var button := event as InputEventMouseButton
	if button and button.pressed and button.button_index == MOUSE_BUTTON_RIGHT:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if button and not button.pressed and button.button_index == MOUSE_BUTTON_RIGHT:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if button and button.button_index == MOUSE_BUTTON_WHEEL_UP:
		xform.origin -= xform.basis.z * 0.1
	if button and button.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		xform.origin += xform.basis.z * 0.1

	%Camera3D.global_transform = xform


func _on_record_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		%TrackerRecorder.start_recording()
		%MixButton.disabled = true
	else:
		%TrackerRecorder.stop_recording()
		%MixButton.disabled = false


func _on_mix_button_pressed() -> void:
	# Disable animation buttons when mixing
	%LoadButton.disabled = true
	%PlayButton.disabled = true
	%SaveButton.disabled = true

	# Mix the tracks
	%TrackerPlayer.stop()
	%TrackerPlayer.body_recording = %TrackerRecorder.body_recording
	%TrackerPlayer.face_recording = %TrackerRecorder.face_recording
	%TrackerPlayer.left_hand_recording = %TrackerRecorder.left_hand_recording
	%TrackerPlayer.right_hand_recording = %TrackerRecorder.right_hand_recording
	%TrackerPlayer.play()
	%AnimationRecorder.start_recording()


func _on_tracker_player_finished() -> void:
	# Stop and save the animation
	%AnimationRecorder.stop_recording()
	animation = %AnimationRecorder.animation

	# Restore animation control buttons
	%LoadButton.disabled = false
	%PlayButton.disabled = false
	%SaveButton.disabled = false


func _on_load_button_pressed() -> void:
	%LoadDialog.show()


func _on_load_dialog_file_selected(path: String) -> void:
	animation = ResourceLoader.load(path) as Animation


func _on_play_button_pressed() -> void:
	# Stop any current animation
	%AnimationPlayer.stop()

	# Get the animation library
	var lib : AnimationLibrary = %AnimationPlayer.get_animation_library("")
	if not lib:
		lib = AnimationLibrary.new()
		%AnimationPlayer.add_animation_library("", lib)

	# Swap the animation
	if lib.has_animation("animation"):
		lib.remove_animation("animation")
	lib.add_animation("animation", animation)

	# Play the animation
	%AnimationPlayer.play("animation")


func _on_save_button_pressed() -> void:
	%SaveDialog.show()


func _on_save_dialog_file_selected(path: String) -> void:
	ResourceSaver.save(animation, path)
