public with sharing class Sum_Amount_For_Account {
    public class InPut{
        @invocableVariable(label = 'Account Id')
        public String Account_Id; 
    }
    public class OutPut{
        @invocableVariable(label = 'Sum All Opportunity Amount')
        public Decimal SumAllOpportunityAmount; 
    }
    @invocableMethod(label = 'Sum Amount For Account')
    public static List<OutPut> SumAmountForAccount(List<InPut> AccountIds) {
        InPut AccountId = AccountIds[0];
        List<OutPut> SObjectLst = new List<OutPut>();
        AggregateResult OpportunitysSum = [SELECT Sum(Amount) SumAllOpportunityAmount
                                           FROM Opportunity
                                           WHERE StageName = 'Closed Won'
                                           AND AccountId = :AccountId.Account_Id];
        OutPut Sum = new OutPut();
        Sum.SumAllOpportunityAmount = (Decimal)OpportunitysSum.get('SumAllOpportunityAmount');
        System.debug(Sum.SumAllOpportunityAmount);
        SObjectLst.add(Sum);
        return SObjectLst;
    }
 }