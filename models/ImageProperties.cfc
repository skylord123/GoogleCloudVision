component hint="" accessors="true" transient {
	property name="info"					type="struct";	//raw

	// Get the dominant colors in the image
	property name="colors"		type="array";	

    public function init() {
    	return this;
    }
}