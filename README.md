# GoogleCloudVision
Implements Google Cloud Vision Api for Coldbox Coldfusion

The Cloud Vision API gives you simple access to multiple image recognition methods using machine learning, e.g.
 - face detection
 - landmark detection
 - explict content detection
 - logo detection
 - OCR 


See https://cloud.google.com/vision/
as well https://cloud.google.com/vision/docs/

Currently API Key only is supported

## Installation 
You will need a Google Account to work with this API
As well you need to set up Google Cloud APIs
See here: https://cloud.google.com/vision/docs/quickstart


This API can be installed as standalone or as a ColdBox Module.  Either approach requires a simple CommandBox command:

```
box install GoogleCloudVision
```

Then follow either the standalone or module instructions below.

### Standalone

This API will be installed into a directory called `GoogleCloudVision` and then the API can be instantiated via ` new GoogleCloudVision.models.VisionClient(apiKey='YOUR_KEY_GOES_HERE')` with the following constructor arguments:

### ColdBox Module

This package also is a ColdBox module as well.  The module can be configured by adding `GoogleApiKey` in your application configuration file: `config/Coldbox.cfc` with the following settings:

```
	settings = {

		// Your Google API Key
		GoogleApiKey = "",
		
		// Your settings....

	};
```

Then you can leverage the API CFC via the injection DSL: `VisionClient@GoogleCloudVision`

## Usage
```
/**
* A normal ColdBox Event Handler
*/
component{
	property name="VisionClient" inject="VisionClient@GoogleCloudVision";
	
	function index(event,rc,prc){

		// detect landmarks
		var img = VisionClient.image('http://www0.f1online.de/preW/011559000/11559221.jpg').detect_landmarks();
		VisionClient.annotate(img);
		writeDump(img.getAnnotation());		

		abort;
	}
}
```

## Written by
www.akitogo.com

## Disclaimer
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
