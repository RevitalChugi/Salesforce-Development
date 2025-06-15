trigger Q10 on Account (after update) {
    List<Account> InsertLst = Trigger.new;
    List<Account> AccountCopyLst = new List<Account>();
    
    for(Account item : InsertLst){
        if(item.Type != null && item.Type.contains('Partner')){
            Account a = item.clone();
            a.Name = item.Name + ' Copy';
            a.id = null;
            AccountCopyLst.add(a);
        }
    }
    
    if(AccountCopyLst.size()>0){
        insert AccountCopyLst;
    }
}