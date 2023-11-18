@isTest
public with sharing class DailyLeadProcessorTest {

    public static String CRON_EXP = '0 0 0 15 3 ? 2042';

    @IsTest
    static void scheduleTest(){
        List<Lead> leads = new List<Lead> ();

        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(
                LastName = 'doe' + i,
                Company = 'Company' + i));
        }

        insert leads;

        List<Lead> queriedLeads = [SELECT Id, Name, LeadSource FROM Lead];
        System.assertEquals(200, queriedLeads.size());
        System.assertEquals(null, queriedLeads[0].LeadSource);
        
        Test.startTest();
        
        String jobId = System.schedule('ScheduledLeadTest', CRON_EXP, new DailyLeadProcessor());

        Test.stopTest();

        queriedLeads = [SELECT Id, Name, LeadSource FROM Lead];
        
        System.assertEquals(200, queriedLeads.size());
        System.assertEquals('Dreamforce', queriedLeads[0].LeadSource);
    }
}