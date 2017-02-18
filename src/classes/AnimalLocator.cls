/**
 * Created by skvarma on 2017-02-15.
 */

public with sharing class AnimalLocator {


    public static String getAnimalNameById(Integer animalID){

        Http http = new Http();
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setMethod('GET');
        httpRequest.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+animalID);
        HttpResponse httpResponse = http.send(httpRequest);
        String animalString = '';

        if (httpResponse.getStatusCode() == 200){
            //Map<String,Object> responseObj = (Map<String,Object>) JSON.deserializeUntyped(httpResponse.getBody());
            Json2Animal animal = (Json2Animal) Json2Animal.parse(httpResponse.getBody());
            animalString = animal.animal.name;

        }

        system.debug('Animal String =' + animalString);
        return animalString;

    }

}