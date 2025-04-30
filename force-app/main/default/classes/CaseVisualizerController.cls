public with sharing class CaseVisualizerController {

    @AuraEnabled
    public static void notifySlack(String messageText) {
        SlackNotificationService.sendMessage(messageText);
    }
}
