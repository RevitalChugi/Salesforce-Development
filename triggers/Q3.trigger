trigger Q3 on OpportunityLineItem (after insert) {
    List<OpportunityLineItem> InsertOpportunityLst = Trigger.new;
   Map<Id,OpportunityLineItem> InsertOpportunityMap = Trigger.newMap;


}