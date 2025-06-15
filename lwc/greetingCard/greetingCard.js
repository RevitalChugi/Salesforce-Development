import { LightningElement, track } from 'lwc';

export default class GreetingCard extends LightningElement {
    // @track change = 'Click Me To View Alert';     
    @track name;

    handleChange(event) {
        this.name = event.target.value;
    }

    handaleClick(){
        alert("Hello " + this.name);
    }
}