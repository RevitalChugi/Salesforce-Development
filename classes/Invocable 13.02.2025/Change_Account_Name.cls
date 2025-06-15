public class Change_Account_Name {
    public class InPut{
        @invocableVariable(label = 'New Name')
        public String New_Name;
        
        @invocableVariable(label = 'Account Id')
        public String Account_Id; 
    }
    @invocableMethod(label = 'Change')
    public static void Change(List<InPut> Details){
        InPut Detail = Details[0];
        Account accName = [SELECT Name 
                           FROM Account
                           WHERE Id = :Detail.Account_Id
                           LIMIT 1];
        accName.Name = Detail.New_Name;
        update accName;
    }
}