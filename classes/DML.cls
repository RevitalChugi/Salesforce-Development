public with sharing class DML {
    //-----------------------Questions-------------------------------------
    //----Q1----
    public static void insertRecord(){
        Account a = new Account(Name='Test Company', Phone='1234567890');
        insert a;
    }

    //----Q2----
    public static void updateRecord(){
        List<Account> UpdateRecord = [SELECT id
                                      FROM Account
                                      WHERE Name = 'Test Company'];
                                        
        for(Account item: UpdateRecord){
            item.Industry = 'Finance';
        }
        update UpdateRecord;
    }

    //----Q3----
    public static void deleteRecord(){
        List<Account> UpdateRecord = [SELECT id
                                      FROM Account
                                      WHERE Name = 'Test Company'];                                
        delete UpdateRecord;
    }

    //----Q6----
    public static void insertXRecord(){
        List<Opportunity> InsertXRecord = new List<Opportunity>();
        for(integer i = 0; i < 5; i++){
            InsertXRecord[i] = new Opportunity(Name='Opportunity'+ (i+1), Amount=10000.00);
        }
        insert InsertXRecord;
    }

    //----Q7----
    public static void updateXRecord(){
        List<Case> UpdateXRecord = [SELECT id
                                    FROM Case
                                    WHERE Status = 'New'];
                                        
        for(Case item: UpdateXRecord){
            item.Priority = 'High';
        }
        update UpdateXRecord;
    }

    //----Q8----
    public static void deleteXRecord(){
        Date newDate =  Date.Today();
        integer newDate1 =  newDate.month();
        Date nextMonth = newDate.addMonths(-1);
        integer nextMonth1 =  nextMonth.month();

        List<Lead> DeleteXRecord = [SELECT id
                                    FROM Lead
                                    // WHERE newDate1 > :nextMonth1
                                   ];                               
        delete DeleteXRecord;
    }

    //----Q9----
    public static void insertRecord2(String name, String phone){
        Account b = new Account(Name=name, Phone=phone);
        insert b;
    } 

    //----Q11----
    public static void updateRecord2(){
        List<Account> UpdateRecord2 = [SELECT id
                                      FROM Account
                                      WHERE Name = 'Tech Corp'];
                                        
        for(Account item: UpdateRecord2){
            if(item.Phone == null){
                item.Phone = '9876543210';
            }
        }
        update UpdateRecord2;
    }

    //----Q12----
    public static void updateRecord3(){
        List<Opportunity> UpdateRecord3 = [SELECT Id
                                           FROM Opportunity
                                           WHERE StageName = 'Open'];
                                        
        for(Opportunity item: UpdateRecord3){
            item.Amount *= 1.1;
        }
        update UpdateRecord3;
    }

    //----Q13----
    public static void DeleteXRecord2(){
        Date NewDate = Date.TODAY().addDays(90);
        List<Case> DeleteXRecord2 = [SELECT Id
                                     FROM Case
                                     Where Status = 'Closed'
                                     AND CreatedDate < :NewDate];
        delete DeleteXRecord2;
        
    }

    //----Q14----
    public static void DeleteXRecord3(){
        List<Opportunity> DeleteXRecord3 = [SELECT Id
                                            FROM Opportunity
                                            WHERE StageName = 'Prospecting'];
     
    for(Opportunity item: DeleteXRecord3){
        item.StageName = 'Qualification';
    }
    update DeleteXRecord3;
    }

}