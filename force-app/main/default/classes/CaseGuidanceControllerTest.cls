@isTest
public class CaseGuidanceControllerTest {
    @isTest
    static void testGetOpenCases() {
        // Create test data
        List<Case> testCases = new List<Case>{
            new Case(Subject='Test Case 1', Status='New'),
            new Case(Subject='Test Case 2', Status='Working')
        };
        insert testCases;

        // Call method
        Test.startTest();
        List<Case> result = CaseGuidanceController.getOpenCases();
        Test.stopTest();

        // Assert
        System.assert(result.size() > 0, 'There should be at least one open case returned.');
    }
}
