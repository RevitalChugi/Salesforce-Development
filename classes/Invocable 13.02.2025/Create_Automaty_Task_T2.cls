public with sharing class Create_Automaty_Task_T2 {

    public class InPut{
        @invocableVariable(label = 'Active Accounts')
        public List<Account> ActiveAccount;
    }
    @invocableMethod(label = 'Create Automaty Task')
    public static void CreateAutomatyTask(List<InPut> ActiveAccounts) {
        List<Account> ActiveAccountsString = ActiveAccounts[0].ActiveAccount;
        List<Task> NewTasksLst = new List<Task>();

        for (Account AccountId : ActiveAccountsString) {
            Task NewSingleTask = new Task(Subject = 'מעקב אחר לקוח', ActivityDate = Date.today().addDays(7), WhatId = AccountId.Id);
            NewTasksLst.add(NewSingleTask);
        }
        insert NewTasksLst;
    }
}