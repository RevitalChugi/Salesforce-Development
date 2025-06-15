public with sharing class FoundContact {

    @InvocableVariable(label = 'First Name' description = '')
        public String FirstName1;

    @InvocableVariable(label = 'Last Name' description = '')
        public String LastName1;

    @InvocableVariable(label = 'Phone' description = '')
        public String Phone1;

    @InvocableVariable(label = 'Choose a package' description = '')
        public String Choose;

    @InvocableMethod(label = 'Found Contact Or Create' description = '')
    public static void FoundContactOrCreate(List<FoundContact> DetailsLst) {
        FoundContact FC = DetailsLst[0];
        List<Contact> ContactDetailsLst = [SELECT Id, FirstName, LastName, Phone
                                           FROM Contact
                                           WHERE FirstName = :FC.FirstName1
                                           AND LastName = :FC.LastName1
                                           AND Phone = :FC.Phone1
                                           LIMIT 1];
                     
        Package_On_Order_EM__c PO = new Package_On_Order_EM__c();  
        if(ContactDetailsLst.isEmpty()){
            Contact C = new Contact(FirstName = FC.FirstName1, LastName = FC.LastName1, Phone = FC.Phone1);
            insert C;
            PO.Contact_Name__c = C.Id;
        }
        else{
            PO.Contact_Name__c = ContactDetailsLst[0].Id;
        }
        PO.Packages_EM_Code__c = FC.Choose;
        insert PO;
    }
}