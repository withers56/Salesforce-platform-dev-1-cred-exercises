@isTest
global class ParkServiceMock implements WebServiceMock{
    global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        // calculatorServices.doAddResponse response_x = 
        //     new calculatorServices.doAddResponse();
        // response_x.return_x = 3.0;

        ParkService.byCountryResponse response_x  = new ParkService.byCountryResponse();

        List<String> parks = new List<String>();

        parks.add('Hamburg Wadden Sea National Park');
        parks.add('Hainich National Park');
        parks.add('Bavarian Forest National Park');

        response_x.return_x = parks;
        // end
        response.put('response_x', response_x); 
   }
}