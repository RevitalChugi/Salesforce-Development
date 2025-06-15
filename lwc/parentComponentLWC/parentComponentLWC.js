import { LightningElement } from 'lwc';


export default class ParentComponentLWC extends LightningElement {
    number;
    name;
    email;
    newValueNumberParent= 0;
    text;
    checked1;
    checked2;

    handaleChange(event){
        this.number = event.target.value;
    }

    handaleBlur(event){
        this.text = event.target.value;
    }

    showJson(event){
        this.name =  event.detail.name;
        this.email =  event.detail.email;
    }

    showJson1(event){
        this.newValueNumberParent = Number(event.detail.newValueNumber);
    }

    handleCheckbox1(event) {
        this.checked1 = event.detail.checked1;
    }

    handleCheckbox2(event) {
        this.checked2 = event.detail.checked2;
    }
}