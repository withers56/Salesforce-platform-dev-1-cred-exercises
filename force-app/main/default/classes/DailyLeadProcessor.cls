public with sharing class DailyLeadProcessor implements Schedulable{
    public void execute(SchedulableContext ctx) {
        // awesome code here
        List<Lead> leadsToUpdate = new List<Lead> ();

        for (Lead lead : [SELECT Id, Name, LeadSource FROM Lead WHERE LeadSource = null LIMIT 200]) {
            lead.LeadSource = 'Dreamforce';
            leadsToUpdate.add(lead);
        }

        update leadsToUpdate;
    }
    
}