@isTest
public with sharing class LeadProcessorTest {
    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // insert leads
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(FirstName='Lead ', LastName = i + '', Company = 'testCompany' + i, 
                LeadSource='testsource'));
        }
        insert leads;
    }

    @isTest static void test() {
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from lead where LeadSource = 'Dreamforce']);
    }
}