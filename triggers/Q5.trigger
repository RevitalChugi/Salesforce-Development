trigger Q5 on Lead (after update) {
    List<Lead> updateLeadLst = Trigger.new;
    Map<Id, Lead> updateLeadMap = Trigger.newMap;

    for(Lead item : updateLeadLst){
        if(item.Status == 'Converted'){
            system.debug('Status Is Changed');
        }
    }
}