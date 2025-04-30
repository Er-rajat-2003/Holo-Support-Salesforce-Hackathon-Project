import { LightningElement, track } from 'lwc';
import arDemoImage from '@salesforce/resourceUrl/AR_Demo';
import sendSlackNotification from '@salesforce/apex/SlackController.sendSlackNotification';

export default class ArCaseVisualizer extends LightningElement {
    @track caseNumber = '';
    @track showARInteraction = false;

    arDemoImageUrl = arDemoImage;

    handleCaseNumberChange(event) {
        this.caseNumber = event.target.value;
    }

    launchARInteraction() {
        if (this.caseNumber) {
            this.showARInteraction = true;
            console.log('AR Interaction launched for case: ' + this.caseNumber);

            // Slack notification call
            sendSlackNotification({ caseNumber: this.caseNumber })
                .then(() => {
                    console.log('Slack notification sent successfully.');
                })
                .catch(error => {
                    console.error('Error sending Slack notification: ', error);
                });
        } else {
            this.showARInteraction = false;
            console.log('Please enter a case number to launch AR Interaction.');
        }
    }
}
