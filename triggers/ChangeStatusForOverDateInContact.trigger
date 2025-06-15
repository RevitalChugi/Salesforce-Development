trigger ChangeStatusForOverDateInContact on Contact (after update) {
    // List<Contact> NewContactChanges = Trigger.new;
    Set<Id> ContactIdsSet = new Set<Id>();
    for (Contact contact : Trigger.new) 
        ContactIdsSet.add(contact.Id);
    List<Contract> ContractLst = [SELECT EndDate 
                                  FROM Contract
                                  WHERE Id in :ContactIdsSet];
    // for (Contact change : NewContactChanges) {
    //     change.Status = change.EndDate.get('day') > Date.today().get('day') ? 'Expired' : null;
    // }

    // Contract
}