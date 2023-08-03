public class AccountDeletionController {
    public static void deleteAccountsContainingAmazon() {
        List<Account> accountsToDelete = [SELECT Id FROM Account WHERE Name LIKE '%Amazon%'];
        
        if (!accountsToDelete.isEmpty()) {
            delete accountsToDelete;
        }
    }
}
