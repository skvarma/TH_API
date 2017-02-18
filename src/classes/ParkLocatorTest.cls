/**
 * Created by skvarma on 2017-02-18.
 */
@isTest
public with sharing class ParkLocatorTest {

    @isTest
    public static void tesrPark(){

        Test.setMock(WebServiceMock.class, new ParkServiceMock());

        String[] parkList = ParkLocator.country('Japan');

        System.assert(parkList.size()==2, 'Incorrect # of Parks');

    }
}