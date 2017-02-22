/**
 * Created by skvarma on 2017-02-19.
 */
@isTest
public with sharing class CaseManagerTest {

    @TestSetup
    public static void createTestRecord(){
        Case testCase = new Case(Subject='Test Case-12345', Status='New', Origin='Phone', Priority='Medium');
        insert testCase;
    }

    @isTest
    public static void testGetCaseById() {
        Case testCase = [SELECT Id, Subject FROM Case WHERE Subject = 'Test Case-12345' LIMIT 1];

        RestRequest request = new RestRequest();
        request.requestURI = 'https://cunning-goat-253455-dev-ed.my.salesforce.com/services/apexrest/Cases/' + testCase.Id;
        request.httpMethod = 'GET';
        RestContext.request = request;
        Case retrievedCase = CaseManager.getCasebyId();

        System.assert(retrievedCase != null, 'Retrieved case was null');
        System.assert(retrievedCase.Subject == testCase.Subject, 'Retrieved incorrect Case');
    }

    @isTest static void testCreateCase() {
        // Call the method to test
        ID thisCaseId = CaseManager.createCase(
                'Ferocious chipmunk', 'New', 'Phone', 'Low');
        // Verify results
        System.assert(thisCaseId != null);
        Case thisCase = [SELECT Id,Subject FROM Case WHERE Id=:thisCaseId];
        System.assert(thisCase != null);
        System.assertEquals(thisCase.Subject, 'Ferocious chipmunk');
    }

    @isTest static void testDeleteCase() {

        Case testCase = [SELECT Id, Subject FROM Case WHERE Subject = 'Test Case-12345' LIMIT 1];
        Id recordId = testCase.Id;
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
                'https://yourInstance.salesforce.com/services/apexrest/Cases/'
                        + recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        CaseManager.deleteCase();
        // Verify record is deleted
        List<Case> cases = [SELECT Id FROM Case WHERE Id=:recordId];
        System.assert(cases.size() == 0);
    }

    @isTest static void testUpsertCase() {
        // 1. Insert new record
        ID case1Id = CaseManager.upsertCase(
                'Ferocious chipmunk', 'New', 'Phone', 'Low', null);
        // Verify new record was created
        System.assert(Case1Id != null);
        Case case1 = [SELECT Id,Subject FROM Case WHERE Id=:case1Id];
        System.assert(case1 != null);
        System.assertEquals(case1.Subject, 'Ferocious chipmunk');
        // 2. Update status of existing record to Working
        ID case2Id = CaseManager.upsertCase(
                'Ferocious chipmunk', 'Working', 'Phone', 'Low', case1Id);
        // Verify record was updated
        System.assertEquals(case1Id, case2Id);
        Case case2 = [SELECT Id,Status FROM Case WHERE Id=:case2Id];
        System.assert(case2 != null);
        System.assertEquals(case2.Status, 'Working');
    }

    @isTest static void testUpdateCaseFields() {
        Case testCase = [SELECT Id, Subject FROM Case WHERE Subject = 'Test Case-12345' LIMIT 1];
        Id recordId = testCase.Id;
        RestRequest request = new RestRequest();
        request.requestUri =
                'https://yourInstance.salesforce.com/services/apexrest/Cases/'
                        + recordId;
        request.httpMethod = 'PATCH';
        request.addHeader('Content-Type', 'application/json');
        request.requestBody = Blob.valueOf('{"status": "Working"}');
        RestContext.request = request;
        // Update status of existing record to Working
        ID thisCaseId = CaseManager.updateCaseFields();
        // Verify record was updated
        System.assert(thisCaseId != null);
        Case thisCase = [SELECT Id,Status FROM Case WHERE Id=:thisCaseId];
        System.assert(thisCase != null);
        System.assertEquals(thisCase.Status, 'Working');
    }
}