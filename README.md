# Godot XR Animation Recorder

![GitHub forks](https://img.shields.io/github/forks/Malcolmnixon/GodotXRAnimationRecorder?style=plastic)
![GitHub Repo stars](https://img.shields.io/github/stars/Malcolmnixon/GodotXRAnimationRecorder?style=plastic)
![GitHub contributors](https://img.shields.io/github/contributors/Malcolmnixon/GodotXRAnimationRecorder?style=plastic)
![GitHub](https://img.shields.io/github/license/Malcolmnixon/GodotXRAnimationRecorder?style=plastic)

Godot XR addon to facilitate recording of XR tracker data and creating an animation file.


## Versions

Official releases are tagged and can be found [here](https://github.com/Malcolmnixon/GodotXRAnimationRecorder/releases).

The following branches are in active development:
|  Branch   |  Description                  |  Godot version   |
|-----------|-------------------------------|------------------|
|  main     | Current development branch    |  Godot 4.3       |


## Overview

Godot XR Animation Recorder provides a set of nodes and scripts suitable for recording motion capture from
XR tracker sources such as:
- [Godot OpenXR](https://github.com/GodotVR/godot_openxr_vendors)
- [Godot XR VMC Tracker](https://github.com/Malcolmnixon/GodotXRVmcTracker)
- [Godot XR Axis Studio Tracker](https://github.com/Malcolmnixon/GodotXRAxisStudioTracker)
- [Godot XR MVN Tracker](https://github.com/Malcolmnixon/GodotXRMvnTracker)
- [Godot XR Rokoko Tracker](https://github.com/Malcolmnixon/GodotXRRokokoTracker)


These XR tracker sources provide different types of XR trackers:
- [XRBodyTracker](https://docs.godotengine.org/en/stable/classes/class_xrbodytracker.html) for tracking body movements (and sometimes hands)
- [XRFaceTracker](https://docs.godotengine.org/en/stable/classes/class_xrfacetracker.html) for tracking face movements
- [XRHandTracker](https://docs.godotengine.org/en/stable/classes/class_xrhandtracker.html) for tracking hand movements


Tracking data can be recorded, and then recombined (possibly including time-shifting) to create a Godot Animation file suitable for character animation.


## Usage

The following steps show how to add the Godot XR Animation Recorder to a project.


### Tracking Avatar

The tracking avatar shows the live XR tracking data. It's not strictly necessary, but can be useful to verify the XR tracking systems are functional. The tracker avatar should be driven by the same XR trackers intended for recording:
- [XRBodyModifier3D](https://docs.godotengine.org/en/stable/classes/class_xrbodymodifier3d.html) driven by body tracker (E.G. `/vmc/body_tracker` for VMC)
- [XRFaceModifier3D](https://docs.godotengine.org/en/stable/classes/class_xrfacemodifier3d.html) driven by face tracker (E.G. `/vmc/face_tracker` for VMC)
- [XRHandModifier3D](https://docs.godotengine.org/en/stable/classes/class_xrhandmodifier3d.html)s driven by hand trackers (E.G. `/user/hand_tracker/left` for OpenXR)


### Tracker Recorder

A `GodotXRTrackerRecorder` node should be constructed to record the XR tracker sources.
![Godot XR Tracker Recorder Settings](/docs/godot-xr-tracker-recorder.png)

Trackers may be left blank if not available - for example the hands may be skipped of the body-tracker provides hand-tracking.

Tracking data can be recorded using the `start_recording()` and `stop_recording()` methods. The tracker recordings are available after the recording finishes:

| Recording Type | Field |
| :---- | :---- |
| Body Tracker Recording | `GodotXRTrackerRecorder.body_recording` |
| Face Tracker Recording | `GodotXRTrackerRecorder.face_recording` |
| Left Hand Tracker Recording | `GodotXRTrackerRecorder.left_hand_recording` |
| Right Hand Tracker Recording | `GodotXRTrackerRecorder.right_hand_recording` |

The recordings are [Godot Resources](https://docs.godotengine.org/en/stable/classes/class_resource.html) and as such can be loaded and saved using the `ResourceLoader.load()` and `ResourceSaver.save()` methods.


### Audio Recorder

A `GodotXRAudioRecorder` node may be constructed to record audio synchronous with the tracker performance.

Audio can be recorded using the `start_recording()` and `stop_recording()` methods. The `GodotXRAudioRecorder.audio` recording is available after the recording finishes.

The audio is a [Godot AudioStreamWAV](https://docs.godotengine.org/en/stable/classes/class_audiostreamwav.html) resource, and as such can be loaded and saved using the `ResourceLoader.load()` and `ResourceSaver.save()` methods.


### Tracker Player

Once XR tracker recordings have been created using the [Tracker Recorder](#tracker-recorder) they can be played into the [Mixing Avatar](#mixing-avatar) using a `GodotXRTrackerPlayer`. Selecting different recordings allows for mixing new face and audio recordings on top of a previously recorded body performance.

Before starting playback, the recordings may be specified using the following fields:

| Recording Type | Field |
| :---- | :---- |
| Body Tracker Recording | `GodotXRTrackerPlayer.body_recording` |
| Face Tracker Recording | `GodotXRTrackerPlayer.face_recording` |
| Left Hand Tracker Recording | `GodotXRTrackerPlayer.left_hand_recording` |
| Right Hand Tracker Recording | `GodotXRTrackerPlayer.right_hand_recording` |

Playback is performed using the `play()` and `stop()` methods.

When playing, the tracker will stream the tracking data out of new virtual trackers. The following are the default tracker names:

| Tracker Type | Name |
| :---- | :---- |
| Body Tracker | `/recording/body_tracker` |
| Face Tracker | `/recording/face_tracker` |
| Left Hand Tracker | `/recording/hand_tracker/left` |
| Right Hand Tracker | `/recording/hand_tracker/right` |

![Godot XR Tracker Player Settings](/docs/godot-xr-tracker-player.png)


### Mixing Avatar

The mixing avatar is an avatar driven by the trackers generated by the [Tracker Player](#tracker-player). It should be a close match to the final avatar the animation is targeting - specifically the face MeshInstance3D and the facial blend-shapes should be identical. It is also recommended to limit the avatars facial blend-shapes to the standard ARKit 52 blend-shapes. This will force the XRFaceModifier3D driving node to target ARKit animations.


### Animation Recorder

A `GodotXRAnimationRecorder` node is used to record animations from the [Mixing Avatar](#mixing-avatar). 

![Godot XR Animation Recorder Settings](/docs/godot-xr-animation-recorder.png)

| Setting | Description |
| :---- | :------ |
| Skeleton | Mixing Avatar skeleton to record to animation |
| Face | Mixing Avatar face-mesh to record to animation |
| Root Motion | Optional Node3D containing avatar root-motion |
| Only 32 Blendshapes | Limit face to 52 blend-shapes |
| Only Godot Humanoid Bones | Limit skeleton to only Godot Humanoid bones |
| Optimize | Optimize animation after recording (todo) |

The `start_recording()` and `stop_recording()` methods control animation recording. Once complete the animation is available through the `animation` field.

The animation is a [Godot Animation](https://docs.godotengine.org/en/stable/classes/class_animation.html) resource, and as such can be loaded and saved using the `ResourceLoader.load()` and `ResourceSaver.save()` methods.

Until optimization is implemented (when the `Animation.optimize` method is exposed) it is recommended that users manually perform the animation optimization on the saved resources using the Animation Edit/Optimize option.
