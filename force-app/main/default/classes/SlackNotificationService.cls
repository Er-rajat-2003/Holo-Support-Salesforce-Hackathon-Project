public with sharing class SlackNotificationService {
    public static void sendMessage(String messageText) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://hooks.slack.com/services/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');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');

        Map<String, Object> payload = new Map<String, Object>();
        payload.put('text', messageText);
        String body = JSON.serialize(payload);
        request.setBody(body);

        try {
            HttpResponse response = http.send(request);
            System.debug('Slack Response Status: ' + response.getStatus());
        } catch (Exception e) {
            System.debug('Error sending message to Slack: ' + e.getMessage());
        }
    }
}
