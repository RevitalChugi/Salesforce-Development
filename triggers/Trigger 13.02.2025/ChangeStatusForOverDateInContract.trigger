trigger ChangeStatusForOverDateInContract on Contract (after update) {
    List<Contract> ContractToUpdate = new List<Contract>();

    for(Contract contract : Trigger.new){
        if(contract.EndDate < Date.today()){
            if(contract.Status != 'Expired'){
                contract.Status = 'Expired';
                ContractToUpdate.add(contract);
            }
        }
    }
    if (!ContractToUpdate.isEmpty())
        update ContractToUpdate;
}