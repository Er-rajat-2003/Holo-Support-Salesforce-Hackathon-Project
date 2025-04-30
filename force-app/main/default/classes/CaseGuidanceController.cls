public with sharing class CaseGuidanceController {
    @AuraEnabled(cacheable=true)
    public static List<Case> getOpenCases() {
        return [
            SELECT Id, CaseNumber, Subject
            FROM Case
            WHERE Status != 'Closed'
            LIMIT 10
        ];
    }
}
