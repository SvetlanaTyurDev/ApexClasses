public class CreateNewAccount {
    public static void createNewAccount(String accountName, String accountType, String industry) {
        Account newAccount = new Account();
        newAccount.Name = accountName;
        newAccount.Type = accountType;
        newAccount.Industry = industry;
        insert newAccount;
    }

}