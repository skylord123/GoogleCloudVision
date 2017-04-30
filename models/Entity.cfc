component hint="" accessors="true" transient {
	property name="info"					type="struct";	//raw

	// Opaque entity ID.
	// Some IDs might be available in Knowledge Graph(KG).
	property name="mid"				type="string";	

	// The language code for the locale in which the entity textual description
	// (next field) is expressed.
	property name="locale"				type="string";	

	// Entity textual description, expressed in its locale language.
	property name="description"		type="string";	
	
	// Overall score of the result.
	// range 0 1 
	property name="score"			type="numeric";	
	
	// The accuracy of the entity detection in an image.
	// range 0 1 
	property name="confidence"			type="numeric";	
	
	// The relevancy of the ICA (Image Content Annotation) label to the image.
	// range 0 1 
	property name="topicality"			type="numeric";	

	// Image region to which this entity belongs
	property name="boundingPoly"		type="any";	

	property name="locations"				type="array";	

    public function init() {
    	
    	return this;
    }
}