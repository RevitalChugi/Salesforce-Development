public with sharing class ViewDataInTableLWC {
    public static List<Product_EM__c> getProductDitels(){
        return [SELECT Name, Product_Category__c, Product_Num__c FROM Product_EM__c];
    }
}