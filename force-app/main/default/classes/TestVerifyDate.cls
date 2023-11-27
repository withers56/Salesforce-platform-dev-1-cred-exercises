@isTest
public with sharing class TestVerifyDate {

    @isTest static void TestCheckDateWithin30Days(){
        Date firstDate = Date.newInstance(2023, 11, 1);
        Date secondDate = Date.newInstance(2023, 11, 24);

        System.assertEquals(secondDate, VerifyDate.CheckDates(firstDate, secondDate));
    }

    @isTest static void TestCheckDateNotWithin30Days(){
        Date firstDate = Date.newInstance(2023, 11, 1);
        Date secondDate = Date.newInstance(2023, 11, 24);

        System.assertEquals(Date.newInstance(2023, 11, 30), VerifyDate.CheckDates(firstDate, secondDate.addDays(30)));
        System.assertEquals(Date.newInstance(2023, 11, 30), VerifyDate.CheckDates(firstDate, Date.newInstance(2023, 11, 30)));
    }
}