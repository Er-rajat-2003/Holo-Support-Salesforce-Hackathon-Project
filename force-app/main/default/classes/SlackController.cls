public with sharing class SlackController {
    @AuraEnabled
    public static void sendSlackNotification(String caseNumber) {
        String message = 'AR Interaction launched for case: ' + caseNumber;
        SlackNotificationService.sendMessage(message);
    }
}
