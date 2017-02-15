Http http = new Http();
HttpRequest httpRequest = new HttpRequest();

httpRequest.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
httpRequest.setMethod('POST');
httpRequest.setHeader('Content-Type', 'application/json;charset=UTF-8');
httpRequest.setBody('{"name": "Blue Dog"}');

HttpResponse httpResponse = http.send(httpRequest);

if (httpResponse.getStatusCode() != 201){
    system.debug('Unexpected Status Code' + httpResponse.getStatus());
} else{
    system.debug('Response = ' + httpResponse.getBody());
}
