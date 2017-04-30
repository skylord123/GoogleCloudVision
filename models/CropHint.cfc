component hint="" accessors="true" transient {
	property name="info"					type="struct";	//raw

	// The bounding polygon of the recommended crop.
	property name="boundingPoly"			type="struct";	
	
	// Confidence of this being a salient region.  
	// Range [0, 1].
	property name="confidence"				type="numeric";	
	
	// Fraction of importance of this salient region with respect to the original image.
	property name="importanceFraction"		type="numeric";	

    public function init() {
    	return this;
    }
}