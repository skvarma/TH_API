/**
 * Created by skvarma on 2017-02-21.
 */
@isTest
public with sharing class AccountManagerTest {

    @TestSetup
    public static void setupTestAccount(){
        Account account = new Account(Name='Account ABCD');
        insert account;

        List<Contact> contacts = new List<Contact>();

        for (Integer i=0; i<3;i++){
            Contact contact = new Contact(FirstName='First Name#'+i, LastName='LastName#'+i, AccountId=account.Id);
            contacts.add(contact);
        }
    }

    @isTest
    public static void getAccountContacts(){
        Account account = [SELECT Id from Account WHERE Name='Account ABCD' LIMIT 1];
        RestRequest request = new RestRequest();
        request.requestURI = 'cunning-goat-253455-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+account.Id+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account retievedAccount = AccountManager.getAccount();

        system.assert(retievedAccount.Id==account.Id, 'Error Retrieving Accounts');
        List<Contact> contacts = retievedAccount.Contacts;
        Integer i=0;
        for (Contact contact:contacts) {
            system.assertEquals('First Name#' + i, contact.FirstName, 'Error retrieving all Contacts');
            i++;
        }
    }

}