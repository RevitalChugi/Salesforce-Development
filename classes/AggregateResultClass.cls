public class AggregateResultClass {
      //-----------------------Questions-------------------------------------
    //----Q1----
    public static void countCountry(){
        List<AggregateResult> CountCountryLst = [SELECT BillingCountry, COUNT(id)
                                                 FROM Account
                                                 GROUP BY BillingCountry];
        For(AggregateResult item : CountCountryLst){
            system.debug(item);
        }
            
    }

    //----Q2----
    public static void sumAmount(){
        List<AggregateResult> SumAmountLst = [SELECT Type, SUM(Amount), IsClosed
                                              FROM Opportunity
                                              GROUP BY Type, IsClosed
                                              HAVING IsClosed = TRUE];
        For(AggregateResult item : SumAmountLst){
            system.debug(item);
        }                                   
    }

    //----Q3----
    public static void avgCase(){
        List<AggregateResult> AvgSolvingRequestsLst = [SELECT Type //AVG(SolvingRequests__c)
                                                       FROM Case
                                                       GROUP BY Type];
        For(AggregateResult item : AvgSolvingRequestsLst){
            system.debug(item);
        } 
    }

    //----Q4----
    public static void sumAmount1(){
        List<AggregateResult> SumAmountLst1 = [SELECT AccountId, SUM(Amount)
                                               FROM Opportunity
                                               GROUP BY AccountId
                                               HAVING SUM(Amount) > 200000];
        For(AggregateResult item : SumAmountLst1){
            system.debug(item);
        }                                     
    }

}