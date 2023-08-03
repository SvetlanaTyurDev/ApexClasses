public class ExpenseTriggerHandler {
    public static void validateExpense(List<Expense__c> newExpenses) {
        List<Expense__c> invalidExpenses = new List<Expense__c>();
        
        for (Expense__c expense : newExpenses) {
            if (expense.Amount__c < 0) {
                expense.addError('Expense amount cannot be negative.');
                invalidExpenses.add(expense);
            } else if (expense.Expense_Type__c == 'Travel' && expense.Amount__c < 1000) {
                expense.addError('Travel expense must be greater than or equal to 1000.');
                invalidExpenses.add(expense);
            }
        }
        
        // If there are any invalid expenses, prevent them from being saved.
        if (!invalidExpenses.isEmpty()) {
            for (Expense__c invalidExpense : invalidExpenses) {
                invalidExpense.addError('Expense record is not valid. Please correct the errors.');
            }
        }
    }
}
