public with sharing class GlobalFunction {

    public static void CreateOrUpAccount(String name) {
        List<Account> AccLst = [SELECT Name
                                FROM Account
                                WHERE Name =: name
                                LIMIT 1];
        if (!AccLst.isEmpty()) {
            AccLst[0].Phone = '0534138287';
            update AccLst[0];
        }
        else {
            Account acc2 = new Account(Name = name);
            insert acc2;
        }
    }

    public static List<AggregateResult> LargeStudent(){
        List<AggregateResult> studentLst = [SELECT Course__c, Max(Student__r.Age__c) MaxStudent FROM RishumToCourse__c GROUP BY Course__c];
        return studentLst;
    }

    public static void LowAvgGrades(){
        List<Student__c> student = [SELECT Name FROM Student__c WHERE AverageGrade__c < 70];
    }
}