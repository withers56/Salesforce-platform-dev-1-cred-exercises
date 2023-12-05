@RestResource(urlMapping='/Accounts/<Account_ID>/contacts')
global with sharing class AccountManager {
    
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        
        // Split the url into a list and get the index of the id
        List<String> urlSplit = request.requestURI.split('/');
        Integer idIndex = urlSplit.size() - 2;
        String accountId = urlSplit[idIndex];

        Account result = [SELECT Id, Name, (SELECT Id, Name FROM Contacts)
                          FROM Account 
                          WHERE Id = :accountId];

        return result;
    }
}