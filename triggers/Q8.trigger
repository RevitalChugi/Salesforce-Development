trigger Q8 on Case (after insert) {
    List<Case> insertCaseLst = Trigger.new;
    Map<Id, Case> insertCaseMap = Trigger.newMap;


    List<Task> insertTaskLst = new List<Task>();
    for(Case item : insertCaseLst){
        Task task = new Task(Subject = 'Follow up on case');
        insertTaskLst.add(task);
    }
    
    insert insertTaskLst;
}