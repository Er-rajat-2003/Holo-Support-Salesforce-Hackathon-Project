public with sharing class HoloSupportController {

    // Fetch Knowledge Articles
    @AuraEnabled(cacheable=true)
    public static List<Knowledge__kav> getKnowledgeArticles() {
        return [
            SELECT Id, Title, Article_Body__c
            FROM Knowledge__kav
            WHERE PublishStatus = 'Online' AND Language = 'en_US'
        ];
    }

    // Fetch recent sessions (5 cases)
    @AuraEnabled(cacheable=true)
    public static List<Case> getRecentSessions() {
        return [
            SELECT Id, CaseNumber, Subject, Status
            FROM Case
            WHERE Status = 'New'
            ORDER BY CreatedDate DESC
            LIMIT 5
        ];
    }

    // Fetch guidance for a case number
    @AuraEnabled(cacheable=true)
    public static String getSmartGuidance(String caseNumber) {
        Case caseRecord = [
            SELECT Id, Subject, Status
            FROM Case
            WHERE CaseNumber = :caseNumber
            LIMIT 1
        ];
        return 'Guidance for Case: ' + caseRecord.Subject + ' (Status: ' + caseRecord.Status + ')';
    }

    // AR Test check
    @AuraEnabled
    public static String runARTest() {
        return 'AR System is operational 🚀';
    }

    // ✅ New method to fetch a Case by its number (for AR Case Visualizer)
    @AuraEnabled(cacheable=true)
    public static Case getCaseByNumber(String caseNumber) {
        try {
            return [
                SELECT Id, CaseNumber, Subject, Status, Description
                FROM Case
                WHERE CaseNumber = :caseNumber
                LIMIT 1
            ];
        } catch (Exception e) {
            throw new AuraHandledException('Case not found for number: ' + caseNumber);
        }
    }
}
