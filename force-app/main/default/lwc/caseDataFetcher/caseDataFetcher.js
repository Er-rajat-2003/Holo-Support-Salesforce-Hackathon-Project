import { LightningElement, wire } from 'lwc';
import getRecentCases from '@salesforce/apex/AgentforceHomepageController.getRecentCases';

export default class CaseDataFetcher extends LightningElement {
    cases;
    error;

    @wire(getRecentCases)
    wiredCases({ error, data }) {
        if (data) {
            this.cases = data;
            this.error = undefined;
        } else if (error) {
            this.error = error.body.message;
            this.cases = undefined;
        }
    }
}
