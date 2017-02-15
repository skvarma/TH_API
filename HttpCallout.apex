Http http = new Http();
HttpRequest httpRequest = new HttpRequest();
httpRequest.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
httpRequest.setMethod('GET');
HttpResponse httpResponse = http.send(httpRequest);

if (httpResponse.getStatusCode() == 200){
    Map<String,Object> responseObj = (Map<String,Object>) JSON.deserializeUntyped(httpResponse.getBody());
    
    List<Object> animalsLst = (List<Object>) responseObj.get('animals');
    
    for (Object animal:animalsLst)
        system.debug(animal);
}

