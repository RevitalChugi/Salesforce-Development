import { LightningElement, wire } from 'lwc';
import getProductDitels from '@salesforce/apex/ViewDataInTableLWController.getProductDitels';

export default class ViewDataInTableLWC extends LightningElement {
    getProduct;
    getProductTemp;
    columsDitels;
    searchText;

    @wire(getProductDitels)
     getProductDitels({data, error}){
        if(data){
            this.getProduct = data;
            console.log(data);
            this.columsDitels = 
            [
              {label: 'Name', fieldName: 'Name' }, 
              {label: 'Product Category', fieldName: 'Product_Category__c'}, 
              {label: 'Product Num', fieldName: 'Product_Num__c' } 
            ]
        }
        else if(error)
            // this.getProduct = error;
            console.log(error);
     }

     handleChange(event){
        this.searchText = event.target.value;
        this.getProductTemp = this.getProduct;

        // this.getProduct = (this.searchText == null || this.searchText == ''  ? getProductTemp : []);

        if(this.searchText == null || this.searchText == '')
          this.getProduct = getProductTemp;
        else{
          this.getProduct = [];
          for (var product in this.getProductTemp) {
            if(this.getProductTemp[product].Name.includes(this.searchText))
              this.getProduct.push(product);
            }
        }
     }

     handleClick(){
        getProductDitels({Name : this.searchText})
        .then(data => {
          this.getProduct = data;
        })
        .catch(error => {
            console.error(error);
        });
     }

}