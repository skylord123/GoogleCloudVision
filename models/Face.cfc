component hint="" accessors="true" transient {
	property name="info"					type="struct";	//raw

	// Bounding polygon around the face.
	property name="boundingPoly"			type="struct";
	
	// Bounding polygon around the face.
	// tighter than `boundingPoly` and encloses only the skin part of the face.
	property name="fdBoundingPoly"			type="struct";
	property name="landmarks"				type="array";	


	// Indicates the amount of clockwise/anti-clockwise rotation of the face.
	// Range [-180,180]
	property name="rollAngle"				type="numeric";	
	
	// Yaw angle.
	// Indicates the leftward/rightward angle that the face is pointing.
	// Range [-180,180]
	property name="panAngle"				type="numeric";	

	// Pitch angle.
	// Indicates the upwards/downwards angle that the face is pointing.
	// Range [-180,180]
	property name="tiltAngle"				type="numeric";	
	
	// The detection confidence.
	// Range [0,1]
	property name="detectionConfidence"		type="numeric";	
	
	// Face landmarking confidence.
	property name="landmarkingConfidence"	type="numeric";	
	
	// Joy likelihood.
	property name="joyLikelihood"			type="string";	
	
	// Sorrow likelihood.
	property name="sorrowLikelihood"		type="string";	
	
	// Anger likelihood.
	property name="angerLikelihood"			type="string";	
	
	// Surprise likelihood.
	property name="surpriseLikelihood"		type="string";	
	
	// Under exposure likelihood.
	property name="underExposedLikelihood"	type="string";	
	
	//  Blurred likelihood.
	property name="blurredLikelihood"		type="string";	
	
	// Headwear likelihood.
	property name="headwearLikelihood"		type="string";	
	
    public function init() {
    	
    	return this;
    }
}