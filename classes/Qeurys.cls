public class Qeurys {
    
    public static void hhh(){
    //Q1
    //a
    	List<Contact> ContactLst = [Select LastName, FirstName, Phone From contact];
    //	List<Employee> EmployeeLst = [Select Id, LastName, FirstName, Phone From employee];
    
    //b
       // List<Account> AccountsLst = [Select AcountName, Tahasia, YearHachnasa From Account Where Tahasia = 'Technology'];
    
    //c
       // List<Account> Accounts1Lst = [Select AcountName, (Select FirstName LastName From Contacts) From Account];
    
    //Q2
    //a
        //List<Opportunities> OpportunitiesLst = [Select All, (Select All From Acounts) From Opportunities Where Pozision = 'open'];
    
    //b
       // List<Opportunities> Opportunities1Lst = [Select OpportunityName, SaleShalav, Sum From Opportunities Where Pozision = 'open'];
    
    //c
      //  List<Opportunities> Opportunities2Lst = [Select OpportunityName, (Select AcountName, AcountTahasya From Acounts) From Opportunities];
        }    
}