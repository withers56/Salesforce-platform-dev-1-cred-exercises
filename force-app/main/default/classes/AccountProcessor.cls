public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds){
        List<Account> accountlist  = [SELECT Id, Number_Of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accountIds];
        List<Account> accountsToUpdate = new List<Account>();

        System.debug(accountList.size());

        for (Account acct : accountlist) {
            System.debug(acct.Contacts.size());

            System.debug('Number of contacts: ' + acct.Number_Of_Contacts__c + ' (before updated)');
            acct.Number_Of_Contacts__c = acct.Contacts.size();
            System.debug('Number of contacts: ' + acct.Number_Of_Contacts__c + ' (after updated)');


            accountsToUpdate.add(acct);
        }
        
        System.debug(accountsToUpdate);
        update accountsToUpdate;
    }
}