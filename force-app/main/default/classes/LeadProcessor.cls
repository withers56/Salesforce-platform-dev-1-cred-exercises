public with sharing class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {

    // instance member to retain state across transactions
    public Integer recordsProcessed = 0;


    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Name, LeadSource FROM Lead'
        );
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        List<Lead> leadsToUpdate = new List<Lead> ();
        
        for (Lead currentLead: scope) {
            currentLead.LeadSource = 'Dreamforce';

            leadsToUpdate.add(currentLead);
        }

        update leadsToUpdate;
    }
    public void finish(Database.BatchableContext bc){
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];

        System.debug(job);
    }
}