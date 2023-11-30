public with sharing class AnimalLocator {
    
    public static String getAnimalNameById (Integer animalId) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + animalId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        Map<String,Object> animalMap = (Map<String, Object>) results.get('animal');

        System.debug(animalMap.get('name'));

        return animalMap.get('name') + '';
    }
}