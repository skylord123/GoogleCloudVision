component hint="" accessors="true" transient {
	property name="raw"					type="array";
	
	property name="faces"				type="array";
	property name="labels"				type="array";
	property name="imageProperties"		type="array";
	property name="cropHint"			type="array";
	property name="landmark"			type="array";
	property name="logo"				type="array";

	/*  
	 * 
	 */	
    public function init() {
    	variables.raw = [];
    	variables.faces = [];
    	variables.labels = [];
    	variables.imageProperties = [];
    	variables.cropHint = [];
    	variables.landmark = [];
    	variables.logo = [];
    	
    	return this;
    }

	/*  
	 * 
	 */	
	public function populate(model,data) {
		var properties = getMetaData(model).properties;
		var strct = {};
		for(var i=1; i <= arrayLen(properties); i++){
			var property = {};
			propertyName = properties[i].name;
			if(structKeyExists(data,propertyName))
				setPropertyValue(model,propertyName,data[propertyName]);
		}
		return model;
	}


	/*  
	 * 
	 */	    
	public function populateFromRaw() {
		if(!arraylen(raw))	
			return this;
		for(var singleAnnotation in raw){
			for(var elements in singleAnnotation){
				populateSingle(singleAnnotation,elements);
			}
		}
		return this;
	}    

	/*  
	 * 
	 */		
	private function populateSingle(singleAnnotation,elements) {
		for(var datastructure in singleAnnotation[elements]){
			switch(elements){
				case 'faceAnnotations':
					arrayAppend(faces,populate(new face(),datastructure));
				break;
				case 'labelAnnotations':
					arrayAppend(labels,populate(new entity(),datastructure));
				break;
				case 'landmarkAnnotations':
					arrayAppend(landmark,populate(new entity(),datastructure));
				break;
				case 'logoAnnotations':
					arrayAppend(logo,populate(new entity(),datastructure));
				break;				
				case 'imagePropertiesAnnotation':
					arrayAppend(imageProperties,populate(new imageProperties(),singleAnnotation[elements]['dominantColors']));
				break;
				case 'cropHintsAnnotation':
					for (var ch in singleAnnotation[elements]['cropHints']){
						arrayAppend(cropHint,populate(new cropHint(),ch));
					}
				break;
			}
		}		
	}


	/*  
	 * 
	 */	
	private any function setPropertyValue(model,String key,value){
		var method = model["set#key#"];
		return method(value);
	}
		
}