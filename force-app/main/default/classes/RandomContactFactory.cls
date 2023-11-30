public with sharing class RandomContactFactory {
    public static List<Contact> generateRandomContacts (Integer numContacts, String contactLastName) {
        List<Contact> generatedContacts = new List<Contact> ();

        for (Integer i = 0; i < numContacts; i++) {
            generatedContacts.add(new Contact(FirstName = 'Test' + i, LastName = contactLastName));
        }

        return generatedContacts;
    }
}