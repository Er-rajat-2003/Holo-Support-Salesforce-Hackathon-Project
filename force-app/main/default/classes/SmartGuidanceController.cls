public with sharing class SmartGuidanceController {

    @AuraEnabled(cacheable=true)
    public static List<String> getCaseDetails(String caseNum) {
        List<String> steps = new List<String>();

        Case caseRec = [SELECT Id, Subject, Status, Priority FROM Case WHERE CaseNumber = :caseNum LIMIT 1];

        steps.add('Verify customer details for ' + caseRec.Subject);
        steps.add('Check case status: ' + caseRec.Status);

        if(caseRec.Priority == 'High') {
            steps.add('Escalate to priority handling team');
        } else {
            steps.add('Follow standard resolution workflow');
        }

        steps.add('Log resolution details and close the case.');

        return steps;
    }
}
