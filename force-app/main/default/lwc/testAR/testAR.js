import { LightningElement, track } from 'lwc';
import getRecentSessions from '@salesforce/apex/HoloSupportController.getRecentSessions';

export default class TestAR extends LightningElement {
    @track cases;

    connectedCallback() {
        this.loadCases();
    }

    loadCases() {
        getRecentSessions()
            .then(result => {
                this.cases = result;
            })
            .catch(error => {
                console.error('Error fetching cases: ' + error);
            });
    }

    handleMarkerClick(event) {
        const caseId = event.target.dataset.id;
        alert('Marker clicked for Case ID: ' + caseId);
    }
}
