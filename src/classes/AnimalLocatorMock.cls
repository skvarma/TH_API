/**
 * Created by skvarma on 2017-02-15.
 */
@isTest
public with sharing class AnimalLocatorMock implements HttpCalloutMock{

    public static HttpResponse respond(HttpRequest param1){
        HttpResponse httpResponse = new HttpResponse();

        httpResponse.setHeader('Content-Type','application/json');
        httpResponse.setStatusCode(200);
        httpResponse.setBody('{"animal":{"id":2,"name":"bear","eats":"berries, campers, adam seligman","says":"yum yum"}}');
        return httpResponse;
    }

}