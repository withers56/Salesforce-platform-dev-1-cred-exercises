public with sharing class AddPrimaryContact implements Queueable{

    private String stateAbrrv;
    private Contact contact;

    public AddPrimaryContact(Contact contact, String stateAbbrv) {
        this.stateAbrrv = stateAbbrv;
        this.contact = contact;
    }

    public void execute(QueueableContext context) {
        // awesome code here
        List<Contact> contactsToAdd = new List<Contact> ();

        for (Account acct : [SELECT Id, Name, (SELECT id, FirstName, LastName FROM Contacts ) FROM Account WHERE BillingState = :stateAbrrv LIMIT 200]) {

            Contact clonedContact = contact.clone(false, true);
            clonedContact.AccountId = acct.Id;
            contactsToAdd.add(clonedContact);
        }

        if (contactsToAdd.size() > 0) {
            insert contactsToAdd;
        }
    }
}