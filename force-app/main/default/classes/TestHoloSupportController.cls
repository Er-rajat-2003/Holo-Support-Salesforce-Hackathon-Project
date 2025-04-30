@isTest
public class TestHoloSupportController {

    @isTest
    static void testGetKnowledgeArticles() {
        Knowledge__kav article = new Knowledge__kav(Title='Test Article', Article_Body__c='Sample body', PublishStatus='Online', Language='en_US');
        insert article;

        Test.startTest();
        List<Knowledge__kav> articles = HoloSupportController.getKnowledgeArticles();
        Test.stopTest();

        System.assert(!articles.isEmpty(), 'Articles should be returned');
    }

    @isTest
    static void testGetRecentSessions() {
        insert new Case(Subject='Test AR Case', Status='New');

        Test.startTest();
        List<Case> cases = HoloSupportController.getRecentSessions();
        Test.stopTest();

        System.assert(!cases.isEmpty(), 'Recent sessions should be returned');
    }

    @isTest
    static void testGetSmartGuidance() {
        Case testCase = new Case(Subject='Smart Guidance Test', Status='New');
        insert testCase;

        Test.startTest();
        String guidance = HoloSupportController.getSmartGuidance(testCase.CaseNumber);
        Test.stopTest();

        System.assert(guidance.contains('Guidance for Case'), 'Guidance string should contain case info');
    }

    @isTest
    static void testRunARTest() {
        Test.startTest();
        String result = HoloSupportController.runARTest();
        Test.stopTest();

        System.assertEquals('AR System is operational 🚀', result);
    }

    @isTest
    static void testGetRecentCases() {
        insert new Case(Subject='Recent Case Test', Status='New');

        Test.startTest();
        List<Case> cases = AgentforceHomepageController.getRecentCases();
        Test.stopTest();

        System.assert(!cases.isEmpty(), 'Recent cases should be returned');
    }
}
