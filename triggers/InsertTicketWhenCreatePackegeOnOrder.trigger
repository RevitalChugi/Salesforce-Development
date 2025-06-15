trigger InsertTicketWhenCreatePackegeOnOrder on Package_On_Order_EM__c (after insert) {
    List<Package_On_Order_EM__c> InsertPackegeOnOrderLst = Trigger.new;
    Set<Id> PackageIdsSet = new Set<Id>();
    for (Package_On_Order_EM__c PO : InsertPackegeOnOrderLst) {
        PackageIdsSet.add(PO.Packages_EM_Code__c);
    }

    Map<Id, Packages_EM__c> PackageMap = new Map<Id, Packages_EM__c>(
        [SELECT Id, Number_Tickets_Per_Package__c 
         FROM Packages_EM__c
         WHERE Id in :PackageIdsSet]
    );

    List<Tickets_EM__c> NewTicketsLst = new List<Tickets_EM__c>();
    for(Package_On_Order_EM__c PO: InsertPackegeOnOrderLst){
        Packages_EM__c P = PackageMap.get(PO.Packages_EM_Code__c);
        for (integer i = 0; i < P.Number_Tickets_Per_Package__c; i++) {
            Tickets_EM__c T = new Tickets_EM__c(Package_On_Order_EM__c = PO.Id);
            NewTicketsLst.add(T);
        }
    }
    insert NewTicketsLst;
}