component hint="" accessors="true" transient {
	property name="Annotation";

	property name="features"		type="array";
	property name="source"			type="struct";

	/*  
	 * 
	 */		
    public function init() {
    	variables.features=[];
    	variables.Annotation = new Annotations();
    	return this;
    }

	/*  
	 * 
	 */	
    public function imageSource(any imageSource) {
    	if(isBinary(imageSource)){
    		setSource({'content':ToBase64(imageSource)});
    		return this;
    	}
    	
    	if(IsSimpleValue(imageSource) && refindnocase('gs://',imageSource)){
  	   		setSource({"source":{'gcsImageUri':imageSource}});
    		return this;
    	}

    	if(IsSimpleValue(imageSource) && refindnocase('http[s]*://',imageSource)){
  	   		setSource({"source":{'imageUri':imageSource}});
    		return this;
    	}

    	if(IsSimpleValue(imageSource) && fileExists(imageSource)){
  	   		setSource({'content':ToBase64(fileReadBinary(imageSource))});
    		return this;
    	}    	
    }  	

	/*  
	 * 
	 */	
    public function detect(feature) {
    	arrayAppend(getFeatures(),{"type":feature});

    	return this;
    }

	/*  
	 * 
	 */	
    public function detect_faces(limit=10) {
    	return detect('FACE_DETECTION');
    }  	
    
 	/*  
	 * 
	 */	   
    public function detect_crop_hints( aspect_ratios='', limit=10){
    	return detect('CROP_HINTS');
    }  
 
	/*  
	 * 
	 */	
    public function detect_full_text( language_hints='', limit=10){
    	return detect('DOCUMENT_TEXT_DETECTION');
    }  

	/*  
	 * 
	 */	
    public function detect_labels( limit=10){
    	return detect('LABEL_DETECTION');
    } 

	/*  
	 * 
	 */	
    public function detect_landmarks( limit=10){
    	return detect('LANDMARK_DETECTION');
    }  

	/*  
	 * 
	 */	    
    public function detect_logos( limit=10){
    	return detect('LOGO_DETECTION');
    } 

	/*  
	 * 
	 */	    
    public function detect_properties( limit=10){
    	return detect('IMAGE_PROPERTIES');
    }

	/*  
	 * 
	 */	
    public function detect_safe_search( limit=10){
    	return detect('SAFE_SEARCH_DETECTION');
    }

	/*  
	 * 
	 */	
	public function detect_text( limit=10){
    	return detect('TEXT_DETECTION');
    } 

	/*  
	 * 
	 */	
    public function detect_web( limit=10){
    	return detect('WEB_DETECTION');
    }                                    
}