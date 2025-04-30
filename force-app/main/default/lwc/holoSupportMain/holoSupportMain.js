import { LightningElement, track } from 'lwc';
import getKnowledgeArticles from '@salesforce/apex/HoloSupportController.getKnowledgeArticles';

export default class HoloSupportMain extends LightningElement {
    @track articles;
    @track error;

    handleLoadArticles() {
        getKnowledgeArticles()
            .then(result => {
                this.articles = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error.body.message;
                this.articles = undefined;
            });
    }
}
