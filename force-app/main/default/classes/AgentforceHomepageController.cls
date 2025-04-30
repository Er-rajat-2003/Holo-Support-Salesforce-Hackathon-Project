public with sharing class AgentforceHomepageController {

    @AuraEnabled(cacheable=true)
    public static List<Case> getRecentCases() {
        return [SELECT Id, CaseNumber, Subject, Status FROM Case ORDER BY CreatedDate DESC LIMIT 10];
    }
}
