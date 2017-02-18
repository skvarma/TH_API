/**
 * Created by skvarma on 2017-02-15.
 */
@istest
public with sharing class AnimalsHttpCalloutMock implements HttpCalloutMock{

    public static HttpResponse respond(HttpRequest httpRequest){

        HttpResponse httpResponse = new  HttpResponse();
        httpResponse.setHeader('Content-Type', 'application/json');
        httpResponse.setBody('{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}');
        httpResponse.setStatusCode(200);
        return httpResponse;
    }

}