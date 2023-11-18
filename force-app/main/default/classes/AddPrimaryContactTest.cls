@isTest
public with sharing class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        Contact myContact = new Contact(
            FirstName = 'john',
            LastName = 'doe'
        );
        // add a parent account
        accounts.add(new Account(name='Parent'));
        // add 100 child accounts
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+i,
                BillingState = 'NY'
            ));
        }

        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(
                name='Test Account'+(i + 50),
                BillingState = 'CA'
            ));
        }
        insert myContact;
        insert accounts;
    }
    static testmethod void testQueueable() {
        // query for test data to pass to queueable class
        Contact myContact = [SELECT Id, FirstName, LastName FROM Contact WHERE FirstName = 'john' AND LastName = 'doe'][0]; 
        List<Account> accounts = [select id, name from account where BillingState = 'CA'];
        // Create our Queueable instance
        AddPrimaryContact updater = new AddPrimaryContact(myContact, 'CA');
        // startTest/stopTest block to force async processes to run
        Test.startTest();
        System.enqueueJob(updater);
        Test.stopTest();
        // Validate the job ran. Check if record have correct parentId now
        System.assertEquals('john', myContact.FirstName);
        System.assertEquals(50, [select count() from Contact where accountID IN (SELECT id FROM Account WHERE BillingState = 'CA')]);
        // System.assertEquals('john', myContact.FirstName);
    }
}