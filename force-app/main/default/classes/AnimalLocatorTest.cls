@isTest
public with sharing class AnimalLocatorTest {
    @isTest static  void testGetCallout() {
        // Create the mock response based on a static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('animalLocatorResp');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Associate the callout with a mock response
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        // Call method to test
        String animalName = AnimalLocator.getAnimalNameById(1);
        // Verify mock response is not null
        System.assertEquals('chicken', animalName);     



        // Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // // This causes a fake response to be sent
        // // from the class that implements HttpCalloutMock. 
        // HttpResponse response = AnimalLocator.getAnimalNameById(1);
        // // Verify that the response received contains fake values
        // String contentType = response.getHeader('Content-Type');
        // System.assert(contentType == 'application/json');
        // String actualValue = response.getBody();
        // System.debug(response.getBody());
        // String expectedValue = '{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}';
        // System.assertEquals(expectedValue, actualValue);
        // System.assertEquals(200, response.getStatusCode());
    }  
}