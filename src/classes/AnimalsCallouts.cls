/**
 * Created by skvarma on 2017-02-14.
 */

public with sharing class AnimalsCallouts {

    public static HttpResponse makeGetCallout(){
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
        return httpResponse;
    }

    public static HttpResponse makePostCallout(){
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
        return httpResponse;
    }

}