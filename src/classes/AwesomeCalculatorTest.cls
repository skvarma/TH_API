/**
 * Created by skvarma on 2017-02-18.
 */
@isTest
public with sharing class AwesomeCalculatorTest {

    @isTest
    public static void testCallout(){
        Test.setMock(WebServiceMock.class, new CalculatorCalloutMock());

        Double x = 2.0;
        Double y = 1.0;
        Double sum = AwesomeCalculator.add(x,y);

        System.assert(sum==3.0, 'Calcualtor did not sum properly');
    }


}