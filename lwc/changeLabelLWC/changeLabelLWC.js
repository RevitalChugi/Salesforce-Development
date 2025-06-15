import { LightningElement, track } from 'lwc';

export default class ChangeLabelLWC extends LightningElement {

    @track change = 'I Will Be Change'; 
    @track student;
    
    HandaleChange(event){
        this.change = event.target.value;
    }
}