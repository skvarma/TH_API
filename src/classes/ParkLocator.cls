/**
 * Created by skvarma on 2017-02-18.
 */

public with sharing class ParkLocator {

    public static String[] country(String countryName){
        ParkService.ParksImplPort parkService = new ParkService.ParksImplPort();
        String[] parkList = parkService.byCountry(countryName);
        System.debug(parkList);
        return parkList;
    }

}