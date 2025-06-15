trigger CountAllOpportunityForAccount on Opportunity (after insert, after delete) {
    Set<Id> AccountsIdsSet = new Set<Id>();
    if(Trigger.isInsert){
        for (Opportunity opportunity : Trigger.new) 
            AccountsIdsSet.add(opportunity.AccountId);
    }
    else if(Trigger.isDelete){
        for (Opportunity opportunity : Trigger.old) 
            AccountsIdsSet.add(opportunity.AccountId);
    }

    List<AggregateResult> TotalOpportunities = [SELECT AccountId, Count(Id) CountOpp
                                                FROM Opportunity
                                                WHERE AccountId in :AccountsIdsSet
                                                GROUP BY AccountId];

    Map<Id, Integer> OpportunityCountMap = new Map<Id, Integer>();
    for (AggregateResult count : TotalOpportunities)
        OpportunityCountMap.put((Id)count.get('AccountId'), (Integer)count.get('CountOpp'));//count.AccountId, count.get('CountOpp')
    
    List<Account> AccountIdsLst = [SELECT Id, TotalOpportunities__c
                                   FROM Account
                                   WHERE Id in: AccountsIdsSet];
                                   
    for (Account accId : AccountIdsLst) {
        accId.TotalOpportunities__c = (OpportunityCountMap.get(accId.Id) != null ? OpportunityCountMap.get(accId.Id) : 0);
    }
    update AccountIdsLst;
}