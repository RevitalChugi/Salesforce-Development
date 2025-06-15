public with sharing class ViewDataInTableLWController {

    @AuraEnabled(cacheable=true)
    public static List<Product_EM__c> getProductDitels(String text){
        // return [SELECT Name, Product_Category__c, Product_Num__c FROM Product_EM__c];

        String query = 'SELECT Name, Product_Category__c, Product_Num__c FROM Product_EM__c';
        if(text != null && text != '')
            query += ' WERE Name =: text';

        return Database.query(query);
    }
}