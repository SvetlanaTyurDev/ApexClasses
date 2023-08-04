public class InvoiceScheduler implements Schedulable {
    public void execute(SchedulableContext context) {
        List<Invoice__c> overdueInvoices = [SELECT Id, Name, Due_Date__c, Account_Owner__c FROM Invoice__c WHERE Due_Date__c < TODAY AND Status__c = 'Unpaid'];

        for (Invoice__c invoice : overdueInvoices) {
            sendNotificationEmail(invoice);
        }
    }

    private void sendNotificationEmail(Invoice__c invoice) {
        // Logic to send an email notification to the account owner
        // You can use the Messaging.SingleEmailMessage class to send emails.
        // Example:
        String recipientEmail = invoice.Account_Owner__c.Email;
        String subject = 'Overdue Invoice Notification';
        String body = 'Dear ' + invoice.Account_Owner__c.Name + ',\n\n' +
                      'This is to inform you that Invoice ' + invoice.Name + ' is overdue. Please make the payment at your earliest convenience.\n\n' +
                      'Thanks and Regards,\n' +
                      'Your Company Name';

        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new List<String>{recipientEmail});
        email.setSubject(subject);
        email.setPlainTextBody(body);

        // Send the email
        Messaging.sendEmail(new List<Messaging.Email>{email});
    }
}
