import { LightningElement, track } from 'lwc';
import getCaseDetails from '@salesforce/apex/SmartGuidanceController.getCaseDetails';

export default class SmartGuidancePanel extends LightningElement {
    @track caseNumber;
    @track guidance;
    @track error;

    handleCaseNumberChange(event) {
        this.caseNumber = event.target.value;
    }

    fetchGuidance() {
        getCaseDetails({ caseNum: this.caseNumber })
            .then(result => {
                this.guidance = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error.body.message;
                this.guidance = undefined;
            });
    }
}
