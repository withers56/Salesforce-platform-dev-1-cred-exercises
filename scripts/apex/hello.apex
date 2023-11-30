// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// string tempvar = 'Enter_your_name_here';
// System.debug('Hello World!');
// System.debug('My name is ' + tempvar);


// Account a = new Account(Name='Williams test');
// insert a;

// List<Account> myAccts = [SELECT Id FROM Account WHERE Name = 'Williams test'];

// List<Id> acctIds = new List<Id>();

// for (Account acct : [SELECT Id, Name, Number_Of_Contacts__c FROM Account]) {
//     acctIds.add(acct.Id);
// }

// System.debug(acctIds);

// AnimalLocator.getAnimalNameById(1);

// calculatorServices.CalculatorImplPort calculator = new  calculatorServices.CalculatorImplPort();
// Double x = 1.0;
// Double y = 2.0;
// Double result = calculator.doAdd(x,y);
// System.debug(result);


System.debug(ParkLocator.Country('Germany'));
