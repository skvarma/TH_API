/**
 * Created by skvarma on 2017-02-21.
 */
@RestResource(UrlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;

        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account account = [SELECT Id,Name
                                    , (SELECT ID,Name FROM Contacts)
                            FROM Account WHERE ID = :accountId];
        return account;
    }

}