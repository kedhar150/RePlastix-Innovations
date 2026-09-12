public class EmailNotificationHelper {

    public static void sendRestockApprovalEmail(
        List<Re_Plastic_Innovations_Restock_Request__c> restockRequests
    ) {

        List<Messaging.SingleEmailMessage> emails =
            new List<Messaging.SingleEmailMessage>();

        for (
            Re_Plastic_Innovations_Restock_Request__c restock :
            restockRequests
        ) {

            Messaging.SingleEmailMessage email =
                new Messaging.SingleEmailMessage();

            email.setSubject('Restock Request Approved');

            email.setToAddresses(
                new List<String>{'kedharnadh62@gmail.com'}
            );

            email.setPlainTextBody(
                'The restock request for product ' +
                restock.Product__c +
                ' has been approved. Please proceed with stock update.'
            );

            emails.add(email);
        }

        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }
}
