import { LightningElement, track } from 'lwc';
import startARSession from '@salesforce/apex/HoloSupportController.getRecentSessions';

export default class LiveAgentOverlay extends LightningElement {
    @track sessionStatus;
    @track error;

    startSession() {
        startARSession()
            .then(result => {
                this.sessionStatus = 'AR Session started. Active sessions: ' + result.length;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error.body.message;
                this.sessionStatus = undefined;
            });
    }
}
