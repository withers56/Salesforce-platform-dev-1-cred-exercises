@isTest
public with sharing class AccountProcessorTest {
    @isTest static void TestUpdateContactsNumberAccounts() {
        // Test Setup data
        // Create 200 new Accounts
        List<Account> accts = new List<Account>();
        for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name='TestAccountCountContact' + i, BillingState='CA');
            accts.add(acct);
        }              
        // Perform Test
        // Test.startTest();
        insert accts;                           
        // Test.stopTest();
        // Verify that 200 new Accounts were inserted
        List<Account> verifyAccts = [SELECT Id, Name FROM Account WHERE Name LIKE '%TestAccountCountContact%'];
        List<Id> acctIds = new List<Id> ();
        for (Account addedAcct : verifyAccts) {
            acctIds.add(addedAcct.Id); 
        }  

        Test.startTest();
        AccountProcessor.countContacts(acctIds);
        Test.stopTest();

        //get the accounts after Number of contatcs has been updated
        List<Account> updatedAccounts = [SELECT Id, Name, Number_Of_Contacts__c FROM Account WHERE Name LIKE '%TestAccountCountContact%'];

        System.assertEquals(0, updatedAccounts.get(1).Number_Of_Contacts__c);

        System.assertEquals(200, verifyAccts.size());  
                          
    }
}