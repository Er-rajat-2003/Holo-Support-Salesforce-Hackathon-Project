@isTest
public class smartGuidanceControllerTest {

    @isTest
    static void testGetCaseDetails() {
        Case testCase = new Case(Subject='Guidance Test Case', Status='New');
        insert testCase;

        Test.startTest();
        List<String> result = SmartGuidanceController.getCaseDetails(testCase.CaseNumber);
        Test.stopTest();

        System.assert(!result.isEmpty(), 'Guidance steps should be returned');
    }
}
