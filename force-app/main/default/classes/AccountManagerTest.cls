@isTest
private class AccountManagerTest {
    
    @isTest
    static void getAccountByIdTest() {
        insert new Account(Name='test account');

        Account queriedAcct = [SELECT Id FROM Account WHERE Name = 'test account'][0];

        RestRequest request = new RestRequest();
        // Set request properties
        request.requestUri =
            'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/' + queriedAcct.Id + '/contacts';
        request.httpMethod = 'GET';
        // Set other properties, such as parameters
        request.params.put('status', 'Working');
        // more awesome code here....
        // Finally, assign the request to RestContext if used
        RestContext.request = request;

        Account testacct = AccountManager.getAccount();

        System.assertEquals('test account', testacct.Name);

    }
}