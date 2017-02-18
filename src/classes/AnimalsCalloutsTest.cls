/**
 * Created by skvarma on 2017-02-14.
 */
@IsTest
public with sharing class AnimalsCalloutsTest {

    @IsTest static void testGetCallout(){
        StaticResourceCalloutMock animalCalloutMock = new StaticResourceCalloutMock();
        animalCalloutMock.setStaticResource('GetAnimalResource');
        animalCalloutMock.setStatusCode(200);
        animalCalloutMock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Test.setMock(HttpCalloutMock.class,animalCalloutMock);

        HttpResponse result = AnimalsCallouts.makeGetCallout();


        System.assertNotEquals(null,result,
        'The callout returned a null response.');
        // Verify status code
        System.assertEquals(200,result.getStatusCode(),'The status code is not 200.');
        // Verify content type
        System.assertEquals('application/json;charset=UTF-8', result.getHeader('Content-Type'), 'The content type value is not expected.');
        // Verify the array contains 3 items
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(result.getBody());
        List<Object> animals = (List<Object>) results.get('animals');
        System.assertEquals(3, animals.size(), 'The array should only contain 3 items.');

    }

    @isTest static void testPostCallout(){

        Test.setMock(HttpCalloutMock.class, new AnimalsHttpCalloutMock());

        HttpResponse response = AnimalsCallouts.makePostCallout();

        // Verify that the response received contains fake values
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = response.getBody();
        System.debug(response.getBody());
        String expectedValue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "mighty moose"]}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, response.getStatusCode());
    }

}