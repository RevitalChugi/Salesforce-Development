import { LightningElement, api } from 'lwc';

export default class SonComponentLWC extends LightningElement {
    @api number;
    name;
    email;
    @api firstValueNumber;
    newValueNumber;
    @api text;

    handeleName(event) {
        this.name = event.target.value;
    }
    handeleEmail(event) {
        this.email = event.target.value;
    }
    handleSubmit(event) {
        const form = new CustomEvent("clickevent", {
            detail: { name: this.name, email: this.email }
        });
        this.dispatchEvent(form);
    }

    handeleNumberChange(event) {
        this.newValueNumber = Number(event.target.value);
    }
    handeleMore() {
        this.handleNumber(true);
    }

    handeleLess() {
        this.handleNumber(false);
    }

    handleNumber(flag) {
        const result = flag ? Number(this.firstValueNumber + this.newValueNumber) : Number(this.firstValueNumber - this.newValueNumber);
        const viewnumber = new CustomEvent("clickviewnumber", {
            detail: { newValueNumber: result }
        });
        this.dispatchEvent(viewnumber);
        this.template.querySelector('[data-id="numberInput"]').value = null;
    }

    handleCheckbox1(event){
        this.dispatchEvent(new CustomEvent("checkboxchange1", {
            detail: { checked1: event.target.checked }}));
       
    }

    handleCheckbox2(event){
        this.dispatchEvent(new CustomEvent("checkboxchange2", {
            detail: { checked2: event.target.checked }}));
    }


}