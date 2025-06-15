@isTest
public with sharing class TestGlobalFunction {
    @TestSetup
    static void makeData(){
        Account acc = new Account(Name = 'RC');
        insert acc;
    }

    @isTest
   public static void testcheckAccount() {
        GlobalFunction.CreateOrUpAccount('Revital');
        Account acc1 = [SELECT Name FROM Account WHERE Name = 'Revital' LIMIT 1];
        System.assertEquals(acc1.Name, 'Revital');
//------------------------------------------------------------

        GlobalFunction.CreateOrUpAccount('RC');
        Account acc2 = [SELECT Phone FROM Account WHERE Name = 'RC' LIMIT 1];
        System.assertEquals(acc2.Phone, '0534138287');
//--------------------------------------------------------------

        List<SObject> SObjectToInsertLst = new List<SObject>();
        SObjectToInsertLst.add(new Student__c(Name = 'student1', Age__c = 10));
        SObjectToInsertLst.add(new Student__c(Name = 'student2', Age__c = 15));
        SObjectToInsertLst.add(new Student__c(Name = 'student3', Age__c = 8));
        SObjectToInsertLst.add(new Course__c(Name = 'English'));
        SObjectToInsertLst.add(new Course__c(Name = 'Java'));
        SObjectToInsertLst.add(new Course__c(Name = 'English'));
        SObjectToInsertLst.add(new RishumToCourse__c(Course__c = SObjectToInsertLst[3].Id, Student__c = SObjectToInsertLst[0].Id));
        SObjectToInsertLst.add(new RishumToCourse__c(Course__c = SObjectToInsertLst[4].Id, Student__c = SObjectToInsertLst[1].Id));
        SObjectToInsertLst.add(new RishumToCourse__c(Course__c = SObjectToInsertLst[5].Id, Student__c = SObjectToInsertLst[2].Id));

        insert SObjectToInsertLst;
      
        List<AggregateResult> CheckLst = GlobalFunction.LargeStudent();
        System.assertEquals(CheckLst[0].get('MaxStudent'), 15);
//----------------------------------------------------------------------

        for (SObject stud : SObjectToInsertLst) {
            SObjectType currentType = Schema.getGlobalDescribe().get('Account');

            // Student__c SObject = Schema.getGlobalDescribe().get('student1');

           // if(stud == Schema.getGlobalDescribe().get('Student'))
              //  stud.AverageGrade__c = stud.Name.contains('1') ? 55 : stud.Name.contains('2') ? 88 : 77;
       }
        //update SObjectToInsertLst;
        GlobalFunction.LowAvgGrades();
//-------------------------------------------------------------------


    }
}