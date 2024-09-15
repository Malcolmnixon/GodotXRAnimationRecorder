class_name GodotXRBodyData


## Map of Godot Humanoid Bones to XRBodyTracker Joints
const BODY_BONES : Dictionary = {
	&"Root" : XRBodyTracker.Joint.JOINT_ROOT,
	&"Hips" : XRBodyTracker.Joint.JOINT_HIPS,
	&"Spine" : XRBodyTracker.Joint.JOINT_SPINE,
	&"Chest" : XRBodyTracker.Joint.JOINT_CHEST,
	&"UpperChest" : XRBodyTracker.Joint.JOINT_UPPER_CHEST,
	&"Neck" : XRBodyTracker.Joint.JOINT_NECK,
	&"Head" : XRBodyTracker.Joint.JOINT_HEAD,
	&"HeadTip" : XRBodyTracker.Joint.JOINT_HEAD_TIP,
	#&"LeftEye"
	#&"RightEye",
	&"LeftShoulder" : XRBodyTracker.Joint.JOINT_LEFT_SHOULDER,
	&"LeftUpperArm" : XRBodyTracker.Joint.JOINT_LEFT_UPPER_ARM,
	&"LeftLowerArm" : XRBodyTracker.Joint.JOINT_LEFT_LOWER_ARM,
	&"LeftHand" : XRBodyTracker.Joint.JOINT_LEFT_HAND,
	&"LeftThumbMetacarpal" : XRBodyTracker.Joint.JOINT_LEFT_THUMB_METACARPAL,
	&"LeftThumbProximal" : XRBodyTracker.Joint.JOINT_LEFT_THUMB_PHALANX_PROXIMAL,
	&"LeftThumbDistal" : XRBodyTracker.Joint.JOINT_LEFT_THUMB_PHALANX_DISTAL,
	&"LeftThumbTip" : XRBodyTracker.Joint.JOINT_LEFT_THUMB_TIP,
	&"LeftIndexMetacarpal" : XRBodyTracker.Joint.JOINT_LEFT_INDEX_FINGER_METACARPAL,
	&"LeftIndexProximal" : XRBodyTracker.Joint.JOINT_LEFT_INDEX_FINGER_PHALANX_PROXIMAL,
	&"LeftIndexIntermediate"  : XRBodyTracker.Joint.JOINT_LEFT_INDEX_FINGER_PHALANX_INTERMEDIATE,
	&"LeftIndexDistal" : XRBodyTracker.Joint.JOINT_LEFT_INDEX_FINGER_PHALANX_DISTAL,
	&"LeftIndexTip" : XRBodyTracker.Joint.JOINT_LEFT_INDEX_FINGER_TIP,
	&"LeftMiddleMetacarpal" : XRBodyTracker.Joint.JOINT_LEFT_MIDDLE_FINGER_METACARPAL,
	&"LeftMiddleProximal" : XRBodyTracker.Joint.JOINT_LEFT_MIDDLE_FINGER_PHALANX_PROXIMAL,
	&"LeftMiddleIntermediate"  : XRBodyTracker.Joint.JOINT_LEFT_MIDDLE_FINGER_PHALANX_INTERMEDIATE,
	&"LeftMiddleDistal" : XRBodyTracker.Joint.JOINT_LEFT_MIDDLE_FINGER_PHALANX_DISTAL,
	&"LeftMiddleTip" : XRBodyTracker.Joint.JOINT_LEFT_MIDDLE_FINGER_TIP,
	&"LeftRingMetacarpal" : XRBodyTracker.Joint.JOINT_LEFT_RING_FINGER_METACARPAL,
	&"LeftRingProximal" : XRBodyTracker.Joint.JOINT_LEFT_RING_FINGER_PHALANX_PROXIMAL,
	&"LeftRingIntermediate"  : XRBodyTracker.Joint.JOINT_LEFT_RING_FINGER_PHALANX_INTERMEDIATE,
	&"LeftRingDistal" : XRBodyTracker.Joint.JOINT_LEFT_RING_FINGER_PHALANX_DISTAL,
	&"LeftRingTip" : XRBodyTracker.Joint.JOINT_LEFT_RING_FINGER_TIP,
	&"LeftLittleMetacarpal" : XRBodyTracker.Joint.JOINT_LEFT_PINKY_FINGER_METACARPAL,
	&"LeftLittleProximal" : XRBodyTracker.Joint.JOINT_LEFT_PINKY_FINGER_PHALANX_PROXIMAL,
	&"LeftLittleIntermediate"  : XRBodyTracker.Joint.JOINT_LEFT_PINKY_FINGER_PHALANX_INTERMEDIATE,
	&"LeftLittleDistal" : XRBodyTracker.Joint.JOINT_LEFT_PINKY_FINGER_PHALANX_DISTAL,
	&"LeftLittleTip" : XRBodyTracker.Joint.JOINT_LEFT_PINKY_FINGER_TIP,
	&"RightShoulder" : XRBodyTracker.Joint.JOINT_RIGHT_SHOULDER,
	&"RightUpperArm" : XRBodyTracker.Joint.JOINT_RIGHT_UPPER_ARM,
	&"RightLowerArm" : XRBodyTracker.Joint.JOINT_RIGHT_LOWER_ARM,
	&"RightHand" : XRBodyTracker.Joint.JOINT_RIGHT_HAND,
	&"RightThumbMetacarpal" : XRBodyTracker.Joint.JOINT_RIGHT_THUMB_METACARPAL,
	&"RightThumbProximal" : XRBodyTracker.Joint.JOINT_RIGHT_THUMB_PHALANX_PROXIMAL,
	&"RightThumbDistal" : XRBodyTracker.Joint.JOINT_RIGHT_THUMB_PHALANX_DISTAL,
	&"RightThumbTip" : XRBodyTracker.Joint.JOINT_RIGHT_THUMB_TIP,
	&"RightIndexMetacarpal" : XRBodyTracker.Joint.JOINT_RIGHT_INDEX_FINGER_METACARPAL,
	&"RightIndexProximal" : XRBodyTracker.Joint.JOINT_RIGHT_INDEX_FINGER_PHALANX_PROXIMAL,
	&"RightIndexIntermediate"  : XRBodyTracker.Joint.JOINT_RIGHT_INDEX_FINGER_PHALANX_INTERMEDIATE,
	&"RightIndexDistal" : XRBodyTracker.Joint.JOINT_RIGHT_INDEX_FINGER_PHALANX_DISTAL,
	&"RightIndexTip" : XRBodyTracker.Joint.JOINT_RIGHT_INDEX_FINGER_TIP,
	&"RightMiddleMetacarpal" : XRBodyTracker.Joint.JOINT_RIGHT_MIDDLE_FINGER_METACARPAL,
	&"RightMiddleProximal" : XRBodyTracker.Joint.JOINT_RIGHT_MIDDLE_FINGER_PHALANX_PROXIMAL,
	&"RightMiddleIntermediate"  : XRBodyTracker.Joint.JOINT_RIGHT_MIDDLE_FINGER_PHALANX_INTERMEDIATE,
	&"RightMiddleDistal" : XRBodyTracker.Joint.JOINT_RIGHT_MIDDLE_FINGER_PHALANX_DISTAL,
	&"RightMiddleTip" : XRBodyTracker.Joint.JOINT_RIGHT_MIDDLE_FINGER_TIP,
	&"RightRingMetacarpal" : XRBodyTracker.Joint.JOINT_RIGHT_RING_FINGER_METACARPAL,
	&"RightRingProximal" : XRBodyTracker.Joint.JOINT_RIGHT_RING_FINGER_PHALANX_PROXIMAL,
	&"RightRingIntermediate"  : XRBodyTracker.Joint.JOINT_RIGHT_RING_FINGER_PHALANX_INTERMEDIATE,
	&"RightRingDistal" : XRBodyTracker.Joint.JOINT_RIGHT_RING_FINGER_PHALANX_DISTAL,
	&"RightRingTip" : XRBodyTracker.Joint.JOINT_RIGHT_RING_FINGER_TIP,
	&"RightLittleMetacarpal" : XRBodyTracker.Joint.JOINT_RIGHT_PINKY_FINGER_METACARPAL,
	&"RightLittleProximal" : XRBodyTracker.Joint.JOINT_RIGHT_PINKY_FINGER_PHALANX_PROXIMAL,
	&"RightLittleIntermediate"  : XRBodyTracker.Joint.JOINT_RIGHT_PINKY_FINGER_PHALANX_INTERMEDIATE,
	&"RightLittleDistal" : XRBodyTracker.Joint.JOINT_RIGHT_PINKY_FINGER_PHALANX_DISTAL,
	&"RightLittleTip" : XRBodyTracker.Joint.JOINT_RIGHT_PINKY_FINGER_TIP,
	&"LeftUpperLeg" : XRBodyTracker.Joint.JOINT_LEFT_UPPER_LEG,
	&"LeftLowerLeg" : XRBodyTracker.Joint.JOINT_LEFT_LOWER_LEG,
	&"LeftFoot" : XRBodyTracker.Joint.JOINT_LEFT_FOOT,
	&"LeftToes" : XRBodyTracker.Joint.JOINT_LEFT_TOES,
	&"RightUpperLeg" : XRBodyTracker.Joint.JOINT_RIGHT_UPPER_LEG,
	&"RightLowerLeg" : XRBodyTracker.Joint.JOINT_RIGHT_LOWER_LEG,
	&"RightFoot" : XRBodyTracker.Joint.JOINT_RIGHT_FOOT,
	&"RightToes" : XRBodyTracker.Joint.JOINT_RIGHT_TOES
}

## Dictionary of blend-shape names to XR face blends
const FACE_BLENDS : Dictionary = {
	&"eyelookoutright": XRFaceTracker.FT_EYE_LOOK_OUT_RIGHT,
	&"eyerightright": XRFaceTracker.FT_EYE_LOOK_OUT_RIGHT,
	&"eyeslookoutr": XRFaceTracker.FT_EYE_LOOK_OUT_RIGHT,
	&"eyelookinright": XRFaceTracker.FT_EYE_LOOK_IN_RIGHT,
	&"eyerightleft": XRFaceTracker.FT_EYE_LOOK_IN_RIGHT,
	&"eyeslookinr": XRFaceTracker.FT_EYE_LOOK_IN_RIGHT,
	&"eyelookupright": XRFaceTracker.FT_EYE_LOOK_UP_RIGHT,
	&"eyerightlookup": XRFaceTracker.FT_EYE_LOOK_UP_RIGHT,
	&"eyeslookupr": XRFaceTracker.FT_EYE_LOOK_UP_RIGHT,
	&"eyelookdownright": XRFaceTracker.FT_EYE_LOOK_DOWN_RIGHT,
	&"eyerightlookdown": XRFaceTracker.FT_EYE_LOOK_DOWN_RIGHT,
	&"eyeslookdownr": XRFaceTracker.FT_EYE_LOOK_DOWN_RIGHT,
	&"eyelookoutleft": XRFaceTracker.FT_EYE_LOOK_OUT_LEFT,
	&"eyeleftleft": XRFaceTracker.FT_EYE_LOOK_OUT_LEFT,
	&"eyeslookoutl": XRFaceTracker.FT_EYE_LOOK_OUT_LEFT,
	&"eyelookinleft": XRFaceTracker.FT_EYE_LOOK_IN_LEFT,
	&"eyeleftright": XRFaceTracker.FT_EYE_LOOK_IN_LEFT,
	&"eyeslookinl": XRFaceTracker.FT_EYE_LOOK_IN_LEFT,
	&"eyelookupleft": XRFaceTracker.FT_EYE_LOOK_UP_LEFT,
	&"eyeleftlookup": XRFaceTracker.FT_EYE_LOOK_UP_LEFT,
	&"eyeslookupl": XRFaceTracker.FT_EYE_LOOK_UP_LEFT,
	&"eyelookdownleft": XRFaceTracker.FT_EYE_LOOK_DOWN_LEFT,
	&"eyeleftlookdown": XRFaceTracker.FT_EYE_LOOK_DOWN_LEFT,
	&"eyeslookdownl": XRFaceTracker.FT_EYE_LOOK_DOWN_LEFT,
	&"eyeclosedright": XRFaceTracker.FT_EYE_CLOSED_RIGHT,
	&"eyeblinkright": XRFaceTracker.FT_EYE_CLOSED_RIGHT,
	&"eyerightblink": XRFaceTracker.FT_EYE_CLOSED_RIGHT,
	&"eyesclosedr": XRFaceTracker.FT_EYE_CLOSED_RIGHT,
	&"eyeclosedleft": XRFaceTracker.FT_EYE_CLOSED_LEFT,
	&"eyeblinkleft": XRFaceTracker.FT_EYE_CLOSED_LEFT,
	&"eyeleftblink": XRFaceTracker.FT_EYE_CLOSED_LEFT,
	&"eyesclosedl": XRFaceTracker.FT_EYE_CLOSED_LEFT,
	&"eyesquintright": XRFaceTracker.FT_EYE_SQUINT_RIGHT,
	&"eyessquintr": XRFaceTracker.FT_EYE_SQUINT_RIGHT,
	&"eyesquintleft": XRFaceTracker.FT_EYE_SQUINT_LEFT,
	&"eyessquintl": XRFaceTracker.FT_EYE_SQUINT_LEFT,
	&"eyewideright": XRFaceTracker.FT_EYE_WIDE_RIGHT,
	&"eyerightwide": XRFaceTracker.FT_EYE_WIDE_RIGHT,
	&"eyeswidenr": XRFaceTracker.FT_EYE_WIDE_RIGHT,
	&"eyewideleft": XRFaceTracker.FT_EYE_WIDE_LEFT,
	&"eyeleftwide": XRFaceTracker.FT_EYE_WIDE_LEFT,
	&"eyeswidenl": XRFaceTracker.FT_EYE_WIDE_LEFT,
	&"eyedilationright": XRFaceTracker.FT_EYE_DILATION_RIGHT,
	&"eyerightdilation": XRFaceTracker.FT_EYE_DILATION_RIGHT,
	&"eyedilationleft": XRFaceTracker.FT_EYE_DILATION_LEFT,
	&"eyeleftdilation": XRFaceTracker.FT_EYE_DILATION_LEFT,
	&"eyeconstrictright": XRFaceTracker.FT_EYE_CONSTRICT_RIGHT,
	&"eyerightconstrict": XRFaceTracker.FT_EYE_CONSTRICT_RIGHT,
	&"eyeconstrictleft": XRFaceTracker.FT_EYE_CONSTRICT_LEFT,
	&"eyeleftconstrict": XRFaceTracker.FT_EYE_CONSTRICT_LEFT,
	&"browpinchright": XRFaceTracker.FT_BROW_PINCH_RIGHT,
	&"browpinchleft": XRFaceTracker.FT_BROW_PINCH_LEFT,
	&"browlowererright": XRFaceTracker.FT_BROW_LOWERER_RIGHT,
	&"browlowererleft": XRFaceTracker.FT_BROW_LOWERER_LEFT,
	&"browinnerupright": XRFaceTracker.FT_BROW_INNER_UP_RIGHT,
	&"innerbrowraiserr": XRFaceTracker.FT_BROW_INNER_UP_RIGHT,
	&"browinnerupleft": XRFaceTracker.FT_BROW_INNER_UP_LEFT,
	&"innerbrowraiserl": XRFaceTracker.FT_BROW_INNER_UP_LEFT,
	&"browouterupright": XRFaceTracker.FT_BROW_OUTER_UP_RIGHT,
	&"outerbrowraiserr": XRFaceTracker.FT_BROW_OUTER_UP_RIGHT,
	&"browouterupleft": XRFaceTracker.FT_BROW_OUTER_UP_LEFT,
	&"outerbrowraiserl": XRFaceTracker.FT_BROW_OUTER_UP_LEFT,
	&"nosesneerright": XRFaceTracker.FT_NOSE_SNEER_RIGHT,
	&"nosewrinklerr": XRFaceTracker.FT_NOSE_SNEER_RIGHT,
	&"nosesneerleft": XRFaceTracker.FT_NOSE_SNEER_LEFT,
	&"nosewrinklerl": XRFaceTracker.FT_NOSE_SNEER_LEFT,
	&"nasaldilationright": XRFaceTracker.FT_NASAL_DILATION_RIGHT,
	&"nasaldilationleft": XRFaceTracker.FT_NASAL_DILATION_LEFT,
	&"nasalconstrictright": XRFaceTracker.FT_NASAL_CONSTRICT_RIGHT,
	&"nasalconstrictleft": XRFaceTracker.FT_NASAL_CONSTRICT_LEFT,
	&"cheeksquintright": XRFaceTracker.FT_CHEEK_SQUINT_RIGHT,
	&"cheekraiserr": XRFaceTracker.FT_CHEEK_SQUINT_RIGHT,
	&"cheeksquintleft": XRFaceTracker.FT_CHEEK_SQUINT_LEFT,
	&"cheekraiserl": XRFaceTracker.FT_CHEEK_SQUINT_LEFT,
	&"cheekpuffright": XRFaceTracker.FT_CHEEK_PUFF_RIGHT,
	&"cheekpuffr": XRFaceTracker.FT_CHEEK_PUFF_RIGHT,
	&"cheekpuffleft": XRFaceTracker.FT_CHEEK_PUFF_LEFT,
	&"cheekpuffl": XRFaceTracker.FT_CHEEK_PUFF_LEFT,
	&"cheeksuckright": XRFaceTracker.FT_CHEEK_SUCK_RIGHT,
	&"cheeksuckr": XRFaceTracker.FT_CHEEK_SUCK_RIGHT,
	&"cheeksuckleft": XRFaceTracker.FT_CHEEK_SUCK_LEFT,
	&"cheeksuckl": XRFaceTracker.FT_CHEEK_SUCK_LEFT,
	&"jawopen": XRFaceTracker.FT_JAW_OPEN,
	&"jawdrop": XRFaceTracker.FT_JAW_OPEN,
	&"mouthclosed": XRFaceTracker.FT_MOUTH_CLOSED,
	&"mouthclose": XRFaceTracker.FT_MOUTH_CLOSED,
	&"mouthapeshape": XRFaceTracker.FT_MOUTH_CLOSED,
	&"lipstoward": XRFaceTracker.FT_MOUTH_CLOSED,
	&"jawright": XRFaceTracker.FT_JAW_RIGHT,
	&"jawsidewaysright": XRFaceTracker.FT_JAW_RIGHT,
	&"jawleft": XRFaceTracker.FT_JAW_LEFT,
	&"jawsidewaysleft": XRFaceTracker.FT_JAW_LEFT,
	&"jawforward": XRFaceTracker.FT_JAW_FORWARD,
	&"jawthrust": XRFaceTracker.FT_JAW_FORWARD,
	&"jawbackward": XRFaceTracker.FT_JAW_BACKWARD,
	&"jawclench": XRFaceTracker.FT_JAW_CLENCH,
	&"jawmandibleraise": XRFaceTracker.FT_JAW_MANDIBLE_RAISE,
	&"lipsuckupperright": XRFaceTracker.FT_LIP_SUCK_UPPER_RIGHT,
	&"lipsuckrt": XRFaceTracker.FT_LIP_SUCK_UPPER_RIGHT,
	&"lipsuckupperleft": XRFaceTracker.FT_LIP_SUCK_UPPER_LEFT,
	&"lipsucklt": XRFaceTracker.FT_LIP_SUCK_UPPER_LEFT,
	&"lipsucklowerright": XRFaceTracker.FT_LIP_SUCK_LOWER_RIGHT,
	&"lipsuckrb": XRFaceTracker.FT_LIP_SUCK_LOWER_RIGHT,
	&"lipsucklowerleft": XRFaceTracker.FT_LIP_SUCK_LOWER_LEFT,
	&"lipsucklb": XRFaceTracker.FT_LIP_SUCK_LOWER_LEFT,
	&"lipsuckcornerright": XRFaceTracker.FT_LIP_SUCK_CORNER_RIGHT,
	&"lipsuckcornerleft": XRFaceTracker.FT_LIP_SUCK_CORNER_LEFT,
	&"lipfunnelupperright": XRFaceTracker.FT_LIP_FUNNEL_UPPER_RIGHT,
	&"lipfunnelerrt": XRFaceTracker.FT_LIP_FUNNEL_UPPER_RIGHT,
	&"lipfunnelupperleft": XRFaceTracker.FT_LIP_FUNNEL_UPPER_LEFT,
	&"lipfunnelerlt": XRFaceTracker.FT_LIP_FUNNEL_UPPER_LEFT,
	&"lipfunnellowerright": XRFaceTracker.FT_LIP_FUNNEL_LOWER_RIGHT,
	&"lipfunnellowerleft": XRFaceTracker.FT_LIP_FUNNEL_LOWER_LEFT,
	&"lippuckerupperright": XRFaceTracker.FT_LIP_PUCKER_UPPER_RIGHT,
	&"lippuckerupperleft": XRFaceTracker.FT_LIP_PUCKER_UPPER_LEFT,
	&"lippuckerlowerright": XRFaceTracker.FT_LIP_PUCKER_LOWER_RIGHT,
	&"lippuckerlowerleft": XRFaceTracker.FT_LIP_PUCKER_LOWER_LEFT,
	&"mouthupperupright": XRFaceTracker.FT_MOUTH_UPPER_UP_RIGHT,
	&"upperlipraiserr": XRFaceTracker.FT_MOUTH_UPPER_UP_RIGHT,
	&"mouthupperupleft": XRFaceTracker.FT_MOUTH_UPPER_UP_LEFT,
	&"upperlipraiserl": XRFaceTracker.FT_MOUTH_UPPER_UP_LEFT,
	&"mouthlowerdownright": XRFaceTracker.FT_MOUTH_LOWER_DOWN_RIGHT,
	&"mouthlowerupright": XRFaceTracker.FT_MOUTH_LOWER_DOWN_RIGHT,
	&"lowerlipdepressorr": XRFaceTracker.FT_MOUTH_LOWER_DOWN_RIGHT,
	&"mouthlowerdownleft": XRFaceTracker.FT_MOUTH_LOWER_DOWN_LEFT,
	&"mouthlowerupleft": XRFaceTracker.FT_MOUTH_LOWER_DOWN_LEFT,
	&"lowerlipdepressorl": XRFaceTracker.FT_MOUTH_LOWER_DOWN_LEFT,
	&"mouthupperdeepenright": XRFaceTracker.FT_MOUTH_UPPER_DEEPEN_RIGHT,
	&"mouthupperdeepenleft": XRFaceTracker.FT_MOUTH_UPPER_DEEPEN_LEFT,
	&"mouthupperright": XRFaceTracker.FT_MOUTH_UPPER_RIGHT,
	&"mouthupperleft": XRFaceTracker.FT_MOUTH_UPPER_LEFT,
	&"mouthlowerright": XRFaceTracker.FT_MOUTH_LOWER_RIGHT,
	&"mouthlowerleft": XRFaceTracker.FT_MOUTH_LOWER_LEFT,
	&"mouthcornerpullright": XRFaceTracker.FT_MOUTH_CORNER_PULL_RIGHT,
	&"mouthcornerpullleft": XRFaceTracker.FT_MOUTH_CORNER_PULL_LEFT,
	&"mouthcornerslantright": XRFaceTracker.FT_MOUTH_CORNER_SLANT_RIGHT,
	&"mouthcornerslantleft": XRFaceTracker.FT_MOUTH_CORNER_SLANT_LEFT,
	&"mouthfrownright": XRFaceTracker.FT_MOUTH_FROWN_RIGHT,
	&"lipcornerdepressorr": XRFaceTracker.FT_MOUTH_FROWN_RIGHT,
	&"mouthfrownleft": XRFaceTracker.FT_MOUTH_FROWN_LEFT,
	&"lipcornerdepressorl": XRFaceTracker.FT_MOUTH_FROWN_LEFT,
	&"mouthstretchright": XRFaceTracker.FT_MOUTH_STRETCH_RIGHT,
	&"lipstretcherr": XRFaceTracker.FT_MOUTH_STRETCH_RIGHT,
	&"mouthstretchleft": XRFaceTracker.FT_MOUTH_STRETCH_LEFT,
	&"lipstretcherl": XRFaceTracker.FT_MOUTH_STRETCH_LEFT,
	&"mouthdimplerright": XRFaceTracker.FT_MOUTH_DIMPLE_RIGHT,
	&"mouthdimpleright": XRFaceTracker.FT_MOUTH_DIMPLE_RIGHT,
	&"dimplerr": XRFaceTracker.FT_MOUTH_DIMPLE_RIGHT,
	&"mouthdimplerleft": XRFaceTracker.FT_MOUTH_DIMPLE_LEFT,
	&"mouthdimpleleft": XRFaceTracker.FT_MOUTH_DIMPLE_LEFT,
	&"dimplerl": XRFaceTracker.FT_MOUTH_DIMPLE_LEFT,
	&"mouthraiserupper": XRFaceTracker.FT_MOUTH_RAISER_UPPER,
	&"mouthshrugupper": XRFaceTracker.FT_MOUTH_RAISER_UPPER,
	&"chinraisert": XRFaceTracker.FT_MOUTH_RAISER_UPPER,
	&"mouthraiserlower": XRFaceTracker.FT_MOUTH_RAISER_LOWER,
	&"mouthshruglower": XRFaceTracker.FT_MOUTH_RAISER_LOWER,
	&"mouthloweroverlay": XRFaceTracker.FT_MOUTH_RAISER_LOWER,
	&"chinraiserb": XRFaceTracker.FT_MOUTH_RAISER_LOWER,
	&"mouthpressright": XRFaceTracker.FT_MOUTH_PRESS_RIGHT,
	&"lippressorr": XRFaceTracker.FT_MOUTH_PRESS_RIGHT,
	&"mouthpressleft": XRFaceTracker.FT_MOUTH_PRESS_LEFT,
	&"lippressorl": XRFaceTracker.FT_MOUTH_PRESS_LEFT,
	&"mouthtightenerright": XRFaceTracker.FT_MOUTH_TIGHTENER_RIGHT,
	&"liptightenerr": XRFaceTracker.FT_MOUTH_TIGHTENER_RIGHT,
	&"mouthtightenerleft": XRFaceTracker.FT_MOUTH_TIGHTENER_LEFT,
	&"liptightenerl": XRFaceTracker.FT_MOUTH_TIGHTENER_LEFT,
	&"tongueout": XRFaceTracker.FT_TONGUE_OUT,
	&"tonguelongstep2": XRFaceTracker.FT_TONGUE_OUT,
	&"tongueup": XRFaceTracker.FT_TONGUE_UP,
	&"tonguedown": XRFaceTracker.FT_TONGUE_DOWN,
	&"tongueright": XRFaceTracker.FT_TONGUE_RIGHT,
	&"tongueleft": XRFaceTracker.FT_TONGUE_LEFT,
	&"tongueroll": XRFaceTracker.FT_TONGUE_ROLL,
	&"tongueblenddown": XRFaceTracker.FT_TONGUE_BLEND_DOWN,
	&"tonguecurlup": XRFaceTracker.FT_TONGUE_CURL_UP,
	&"tonguesquish": XRFaceTracker.FT_TONGUE_SQUISH,
	&"tongueflat": XRFaceTracker.FT_TONGUE_FLAT,
	&"tonguetwistright": XRFaceTracker.FT_TONGUE_TWIST_RIGHT,
	&"tonguetwistleft": XRFaceTracker.FT_TONGUE_TWIST_LEFT,
	&"softpalateclose": XRFaceTracker.FT_SOFT_PALATE_CLOSE,
	&"throatswallow": XRFaceTracker.FT_THROAT_SWALLOW,
	&"neckflexright": XRFaceTracker.FT_NECK_FLEX_RIGHT,
	&"neckflexleft": XRFaceTracker.FT_NECK_FLEX_LEFT,
	&"eyeclosed": XRFaceTracker.FT_EYE_CLOSED,
	&"eyewide": XRFaceTracker.FT_EYE_WIDE,
	&"eyesquint": XRFaceTracker.FT_EYE_SQUINT,
	&"eyedilation": XRFaceTracker.FT_EYE_DILATION,
	&"eyeconstrict": XRFaceTracker.FT_EYE_CONSTRICT,
	&"browdownright": XRFaceTracker.FT_BROW_DOWN_RIGHT,
	&"browlowererr": XRFaceTracker.FT_BROW_DOWN_RIGHT,
	&"browdownleft": XRFaceTracker.FT_BROW_DOWN_LEFT,
	&"browlowererl": XRFaceTracker.FT_BROW_DOWN_LEFT,
	&"browdown": XRFaceTracker.FT_BROW_DOWN,
	&"browupright": XRFaceTracker.FT_BROW_UP_RIGHT,
	&"browupleft": XRFaceTracker.FT_BROW_UP_LEFT,
	&"browup": XRFaceTracker.FT_BROW_UP,
	&"nosesneer": XRFaceTracker.FT_NOSE_SNEER,
	&"nasaldilation": XRFaceTracker.FT_NASAL_DILATION,
	&"nasalconstrict": XRFaceTracker.FT_NASAL_CONSTRICT,
	&"cheekpuff": XRFaceTracker.FT_CHEEK_PUFF,
	&"cheeksuck": XRFaceTracker.FT_CHEEK_SUCK,
	&"cheeksquint": XRFaceTracker.FT_CHEEK_SQUINT,
	&"lipsuckupper": XRFaceTracker.FT_LIP_SUCK_UPPER,
	&"mouthrollupper": XRFaceTracker.FT_LIP_SUCK_UPPER,
	&"mouthupperinside": XRFaceTracker.FT_LIP_SUCK_UPPER,
	&"lipsucklower": XRFaceTracker.FT_LIP_SUCK_LOWER,
	&"mouthrolllower": XRFaceTracker.FT_LIP_SUCK_LOWER,
	&"mouthlowerinside": XRFaceTracker.FT_LIP_SUCK_LOWER,
	&"lipsuck": XRFaceTracker.FT_LIP_SUCK,
	&"lipfunnelupper": XRFaceTracker.FT_LIP_FUNNEL_UPPER,
	&"mouthupperoverturn": XRFaceTracker.FT_LIP_FUNNEL_UPPER,
	&"lipfunnellower": XRFaceTracker.FT_LIP_FUNNEL_LOWER,
	&"mouthloweroverturn": XRFaceTracker.FT_LIP_FUNNEL_LOWER,
	&"lipfunnel": XRFaceTracker.FT_LIP_FUNNEL,
	&"mouthfunnel": XRFaceTracker.FT_LIP_FUNNEL,
	&"lippuckerupper": XRFaceTracker.FT_LIP_PUCKER_UPPER,
	&"lippuckerlower": XRFaceTracker.FT_LIP_PUCKER_LOWER,
	&"lippucker": XRFaceTracker.FT_LIP_PUCKER,
	&"mouthpucker": XRFaceTracker.FT_LIP_PUCKER,
	&"mouthpout": XRFaceTracker.FT_LIP_PUCKER,
	&"mouthupperup": XRFaceTracker.FT_MOUTH_UPPER_UP,
	&"mouthlowerdown": XRFaceTracker.FT_MOUTH_LOWER_DOWN,
	&"mouthopen": XRFaceTracker.FT_MOUTH_OPEN,
	&"mouthright": XRFaceTracker.FT_MOUTH_RIGHT,
	&"mouthleft": XRFaceTracker.FT_MOUTH_LEFT,
	&"mouthsmileright": XRFaceTracker.FT_MOUTH_SMILE_RIGHT,
	&"lipcornerpullerr": XRFaceTracker.FT_MOUTH_SMILE_RIGHT,
	&"mouthsmileleft": XRFaceTracker.FT_MOUTH_SMILE_LEFT,
	&"lipcornerpullerl": XRFaceTracker.FT_MOUTH_SMILE_LEFT,
	&"mouthsmile": XRFaceTracker.FT_MOUTH_SMILE,
	&"mouthsadright": XRFaceTracker.FT_MOUTH_SAD_RIGHT,
	&"mouthsadleft": XRFaceTracker.FT_MOUTH_SAD_LEFT,
	&"mouthsad": XRFaceTracker.FT_MOUTH_SAD,
	&"mouthstretch": XRFaceTracker.FT_MOUTH_STRETCH,
	&"mouthdimple": XRFaceTracker.FT_MOUTH_DIMPLE,
	&"mouthtightener": XRFaceTracker.FT_MOUTH_TIGHTENER,
	&"mouthpress": XRFaceTracker.FT_MOUTH_PRESS
}

## Map of Godot Humanoid Bones to left XRHandTracker Joints
const LEFT_HAND_BONES : Dictionary = {
	&"LeftHand" :
		XRHandTracker.HandJoint.HAND_JOINT_WRIST,
	&"LeftPalm" :
		XRHandTracker.HandJoint.HAND_JOINT_PALM,
	&"LeftThumbMetacarpal" :
		XRHandTracker.HandJoint.HAND_JOINT_THUMB_METACARPAL,
	&"LeftThumbProximal" :
		XRHandTracker.HandJoint.HAND_JOINT_THUMB_PHALANX_PROXIMAL,
	&"LeftThumbDistal" :
		XRHandTracker.HandJoint.HAND_JOINT_THUMB_PHALANX_DISTAL,
	&"LeftThumbTip" :
		XRHandTracker.HandJoint.HAND_JOINT_THUMB_TIP,
	&"LeftIndexMetacarpal" :
		XRHandTracker.HandJoint.HAND_JOINT_INDEX_FINGER_METACARPAL,
	&"LeftIndexProximal" :
		XRHandTracker.HandJoint.HAND_JOINT_INDEX_FINGER_PHALANX_PROXIMAL,
	&"LeftIndexIntermediate" :
		XRHandTracker.HandJoint.HAND_JOINT_INDEX_FINGER_PHALANX_INTERMEDIATE,
	&"LeftIndexDistal" :
		XRHandTracker.HandJoint.HAND_JOINT_INDEX_FINGER_PHALANX_DISTAL,
	&"LeftIndexTip" :
		XRHandTracker.HandJoint.HAND_JOINT_INDEX_FINGER_TIP,
	&"LeftMiddleMetacarpal" :
		XRHandTracker.HandJoint.HAND_JOINT_MIDDLE_FINGER_METACARPAL,
	&"LeftMiddleProximal" :
		XRHandTracker.HandJoint.HAND_JOINT_MIDDLE_FINGER_PHALANX_PROXIMAL,
	&"LeftMiddleIntermediate" :
		XRHandTracker.HandJoint.HAND_JOINT_MIDDLE_FINGER_PHALANX_INTERMEDIATE,
	&"LeftMiddleDistal" :
		XRHandTracker.HandJoint.HAND_JOINT_MIDDLE_FINGER_PHALANX_DISTAL,
	&"LeftMiddleTip" :
		XRHandTracker.HandJoint.HAND_JOINT_MIDDLE_FINGER_TIP,
	&"LeftRingMetacarpal" :
		XRHandTracker.HandJoint.HAND_JOINT_RING_FINGER_METACARPAL,
	&"LeftRingProximal" :
		XRHandTracker.HandJoint.HAND_JOINT_RING_FINGER_PHALANX_PROXIMAL,
	&"LeftRingIntermediate" :
		XRHandTracker.HandJoint.HAND_JOINT_RING_FINGER_PHALANX_INTERMEDIATE,
	&"LeftRingDistal" :
		XRHandTracker.HandJoint.HAND_JOINT_RING_FINGER_PHALANX_DISTAL,
	&"LeftRingTip" :
		XRHandTracker.HandJoint.HAND_JOINT_RING_FINGER_TIP,
	&"LeftLittleMetacarpal" :
		XRHandTracker.HandJoint.HAND_JOINT_PINKY_FINGER_METACARPAL,
	&"LeftLittleProximal" :
		XRHandTracker.HandJoint.HAND_JOINT_PINKY_FINGER_PHALANX_PROXIMAL,
	&"LeftLittleIntermediate" :
		XRHandTracker.HandJoint.HAND_JOINT_PINKY_FINGER_PHALANX_INTERMEDIATE,
	&"LeftLittleDistal" :
		XRHandTracker.HandJoint.HAND_JOINT_PINKY_FINGER_PHALANX_DISTAL,
	&"LeftLittleTip" :
		XRHandTracker.HandJoint.HAND_JOINT_PINKY_FINGER_TIP,
}

## Map of Godot Humanoid Bones to right XRHandTracker Joints
const RIGHT_HAND_BONES : Dictionary = {
	&"RightHand" :
		XRHandTracker.HandJoint.HAND_JOINT_WRIST,
	&"RightPalm" :
		XRHandTracker.HandJoint.HAND_JOINT_PALM,
	&"RightThumbMetacarpal" :
		XRHandTracker.HandJoint.HAND_JOINT_THUMB_METACARPAL,
	&"RightThumbProximal" :
		XRHandTracker.HandJoint.HAND_JOINT_THUMB_PHALANX_PROXIMAL,
	&"RightThumbDistal" :
		XRHandTracker.HandJoint.HAND_JOINT_THUMB_PHALANX_DISTAL,
	&"RightThumbTip" :
		XRHandTracker.HandJoint.HAND_JOINT_THUMB_TIP,
	&"RightIndexMetacarpal" :
		XRHandTracker.HandJoint.HAND_JOINT_INDEX_FINGER_METACARPAL,
	&"RightIndexProximal" :
		XRHandTracker.HandJoint.HAND_JOINT_INDEX_FINGER_PHALANX_PROXIMAL,
	&"RightIndexIntermediate" :
		XRHandTracker.HandJoint.HAND_JOINT_INDEX_FINGER_PHALANX_INTERMEDIATE,
	&"RightIndexDistal" :
		XRHandTracker.HandJoint.HAND_JOINT_INDEX_FINGER_PHALANX_DISTAL,
	&"RightIndexTip" :
		XRHandTracker.HandJoint.HAND_JOINT_INDEX_FINGER_TIP,
	&"RightMiddleMetacarpal" :
		XRHandTracker.HandJoint.HAND_JOINT_MIDDLE_FINGER_METACARPAL,
	&"RightMiddleProximal" :
		XRHandTracker.HandJoint.HAND_JOINT_MIDDLE_FINGER_PHALANX_PROXIMAL,
	&"RightMiddleIntermediate" :
		XRHandTracker.HandJoint.HAND_JOINT_MIDDLE_FINGER_PHALANX_INTERMEDIATE,
	&"RightMiddleDistal" :
		XRHandTracker.HandJoint.HAND_JOINT_MIDDLE_FINGER_PHALANX_DISTAL,
	&"RightMiddleTip" :
		XRHandTracker.HandJoint.HAND_JOINT_MIDDLE_FINGER_TIP,
	&"RightRingMetacarpal" :
		XRHandTracker.HandJoint.HAND_JOINT_RING_FINGER_METACARPAL,
	&"RightRingProximal" :
		XRHandTracker.HandJoint.HAND_JOINT_RING_FINGER_PHALANX_PROXIMAL,
	&"RightRingIntermediate" :
		XRHandTracker.HandJoint.HAND_JOINT_RING_FINGER_PHALANX_INTERMEDIATE,
	&"RightRingDistal" :
		XRHandTracker.HandJoint.HAND_JOINT_RING_FINGER_PHALANX_DISTAL,
	&"RightRingTip" :
		XRHandTracker.HandJoint.HAND_JOINT_RING_FINGER_TIP,
	&"RightLittleMetacarpal" :
		XRHandTracker.HandJoint.HAND_JOINT_PINKY_FINGER_METACARPAL,
	&"RightLittleProximal" :
		XRHandTracker.HandJoint.HAND_JOINT_PINKY_FINGER_PHALANX_PROXIMAL,
	&"RightLittleIntermediate" :
		XRHandTracker.HandJoint.HAND_JOINT_PINKY_FINGER_PHALANX_INTERMEDIATE,
	&"RightLittleDistal" :
		XRHandTracker.HandJoint.HAND_JOINT_PINKY_FINGER_PHALANX_DISTAL,
	&"RightLittleTip" :
		XRHandTracker.HandJoint.HAND_JOINT_PINKY_FINGER_TIP,
}

## Names of 52 blend-shapes (lowercase and no separators)
const BLEND_NAMES_52 : Array[StringName] = [
	&"browinnerup",
	&"browdownleft",
	&"browdownright",
	&"browouterupleft",
	&"browouterupright",
	&"eyelookupleft",
	&"eyelookupright",
	&"eyelookdownleft",
	&"eyelookdownright",
	&"eyelookinleft",
	&"eyelookinright",
	&"eyelookoutleft",
	&"eyelookoutright",
	&"eyeblinkleft",
	&"eyeblinkright",
	&"eyesquintleft",
	&"eyesquintright",
	&"eyewideleft",
	&"eyewideright",
	&"cheekpuff",
	&"cheeksquintleft",
	&"cheeksquintright",
	&"nosesneerleft",
	&"nosesneerright",
	&"jawopen",
	&"jawforward",
	&"jawleft",
	&"jawright",
	&"mouthfunnel",
	&"mouthpucker",
	&"mouthleft",
	&"mouthright",
	&"mouthrollupper",
	&"mouthrolllower",
	&"mouthshrugupper",
	&"mouthshruglower",
	&"mouthclose",
	&"mouthsmileleft",
	&"mouthsmileright",
	&"mouthfrownleft",
	&"mouthfrownright",
	&"mouthdimpleleft",
	&"mouthdimpleright",
	&"mouthupperupleft",
	&"mouthupperupright",
	&"mouthlowerdownleft",
	&"mouthlowerdownright",
	&"mouthpressleft",
	&"mouthpressright",
	&"mouthstretchleft",
	&"mouthstretchright"
]


## Test if the name corresponds to a body bone
static func is_body_bone(p_name : String) -> bool:
	return BODY_BONES.has(p_name)


## Test if the name corresponds to a standard 52-blend-shape
static func is_face_blend_52(p_name : String) -> bool:
	# Clean name (lower-case and no underscores)
	var clean_name := p_name.to_lower().replace("_", "");

	return BLEND_NAMES_52.has(clean_name)


## Get a dictionary of XRTracker joint to skeleton bone for the given skeleton
## and joint dictionary (e.g BODY_BONES, LEFT_HAND_BONES, or RIGHT_HAND_BONES)
static func get_joint_bones(p_skeleton : Skeleton3D, p_joints : Dictionary) -> Dictionary:
	# Construct joints
	var joints := {}

	# Iterate through the bones
	for bone_idx in p_skeleton.get_bone_count():
		# Get the bone name
		var bone_name := p_skeleton.get_bone_name(bone_idx)

		# Get the XR joint
		var xr_joint : int = p_joints.get(bone_name, -1)
		if xr_joint < 0:
			continue

		# Save this joint
		joints[xr_joint] = bone_idx

	# Return the dictionary of XR joints to bones
	return joints


## Get a dictionary of XRFaceTracker blends to blend-shape index.
static func get_face_blends(p_mesh : MeshInstance3D) -> Dictionary:
	# Construct blends
	var blends := {}

	# Iterate over all blend-shapes
	for blend in p_mesh.get_blend_shape_count():
		# Get the blend-shape name and path
		var blend_name : String = p_mesh.mesh.get_blend_shape_name(blend)

		# Clean name (lower-case and no underscores)
		var clean_name := blend_name.to_lower().replace("_", "");
		var xr_blend : int = FACE_BLENDS.get(clean_name, -1)
		if xr_blend < 0:
			continue

		# save this blend
		blends[xr_blend] = blend

	# Return the dictionary of XR blends to blend
	return blends
