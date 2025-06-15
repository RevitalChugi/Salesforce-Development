public with sharing class QueueableData implements Queueable {
    public QueueableData() {

    }

    public static void execute(QueueableContext queb){
        List<Case> CaseCreatedLST = [SELECT Id, CreatedDate
                                     FROM Case
                                     WHERE CreatedDate = TODAY];

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('New Case Created : ' + CaseCreatedLST);

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
    }

}