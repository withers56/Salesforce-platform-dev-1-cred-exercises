@isTest
public with sharing class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        List<String> parks = ParkLocator.Country('Germany');
        String park = 'Hamburg Wadden Sea National Park';
        // Verify that a fake result is returned
        System.assertEquals(park, parks[0]); 
    }
}