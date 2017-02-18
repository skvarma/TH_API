/**
 * Created by skvarma on 2017-02-18.
 */
@isTest
global with sharing class ParkServiceMock implements WebServiceMock{

    global void doInvoke(Object stub, Object request, Map<String,Object> response, String endPoint,
            String soapAction, String requestName, String responseNS, String responseName, String responseType){

        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
        response_x.return_x = new String[]{'Park-1', 'Park22'};
        response.put('response_x', response_x);
    }
}