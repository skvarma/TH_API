/**
 * Created by skvarma on 2017-02-15.
 */
@isTest
public with sharing class AnimalLocatorTest {

    @isTest
    public static void animalLocatorTest(){

        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        Integer animalID = 2;
        String  responseString = AnimalLocator.getAnimalNameById(animalID);

        System.assert (responseString.length()>0, 'HTTP Call to Animal Locator failed');
    }
}