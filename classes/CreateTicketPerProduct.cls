public with sharing class CreateTicketPerProduct {

    @InvocableVariable(label = 'Product List' description = '')
        public String ProductStr;

    @InvocableVariable(label = 'Packege On Order Code' description = '')
        public Package_On_Order_EM__c PackegeOnOrderCode;

    @InvocableMethod(label = 'Create Tickets' description = '')
    public static void CreateTickets(List<CreateTicketPerProduct> IdsLst) {
        List<Tickets_EM__c> NewTicketsLst = new List<Tickets_EM__c>();
        List<String> ProductLst = IdsLst[0].ProductStr.Split(';');
        for (String product : ProductLst) {
            Tickets_EM__c T = new Tickets_EM__c(Package_On_Order_EM__c = IdsLst[0].PackegeOnOrderCode.Id, Product_EM__c = product);
            NewTicketsLst.add(T);
        }
        insert NewTicketsLst;
    }
}

 /*
        for (CreateTicketPerProduct id : IdsLst) {
            Package_On_Order_EM__c PO = id.PackegeOnOrderCode;
            for (Product_EM__c product : id.ProductLst) {
                Tickets_EM__c T = new Tickets_EM__c(Package_On_Order_EM__c = PO.Id, Product_EM__c = product.id);
                NewTicketsLst.add(T);
            }
        }
            */