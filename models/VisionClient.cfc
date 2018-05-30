component hint="" accessors="true" singleton {

	property name="uri";
	property name="apiKey";
	property name="httpTimeout";

	variables.uri='https://vision.googleapis.com/v1/images:annotate';
	variables.httpTimeout=5;

	/*  
	 * 
	 */	
    public function init(apiKey) {

    	variables.apiKey=apiKey;
    	return this;
    }

	/*  
	 * 
	 */	
	public function image(imageSource) {
        var image = new image();
        image.imageSource(arguments.imageSource);
        return image;
    }    

	/*  
	 * 
	 */	
	public function annotate(image) {
    	var singleRequest={};
    	singleRequest['image']=image.getsource();
    	singleRequest['features']=image.getfeatures();

    	var requeststruct ={'requests':[singleRequest]};
    	
    	var results= sendRequest(serializeJson(requeststruct));

    	var annotation = image.getAnnotation();
    	annotation.setRaw(deserializeJson(results).responses);
    	annotation.populateFromRaw();
    	
    	return image;
    }    


	/*  
	 * 
	 */	
	public string function sendRequest(	body ) {	
	    var httpService = new http(); 
	    if(structKeyExists(httpService, 'setEncodeUrl')) {
	    	httpService.setEncodeUrl(false);
	    }
	    httpService.setMethod("POST"); 
	    
	    if(structKeyExists(arguments,'endpoint'))
	    	httpService.setUrl("#variables.uri##arguments.endpoint#");
		else
	    	httpService.setUrl(variables.uri);
	    	
	    httpService.settimeout(variables.httpTimeout);
	    httpService.addParam(type="header", name="Host", value="vision.googleapis.com");
			

	    httpService.addParam(type="header", name="Accept-Encoding", value="deflate");
	    httpService.addParam(type="header", name="Content-Type", value="application/json");
		httpService.addParam(type="body", value="#arguments.body#");

		// add api key first
		httpService.addParam(type="URL", name="key", value="#variables.apiKey#");


	    var HTTPResults = httpService.send().getPrefix();
	    return HTTPResults.FileContent;
	}	
}
