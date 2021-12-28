
public class ATM {
    private int pick;

//    static {
//        System.out.println("Welcome to the ATM machine");
//        System.out.println("Please enter your account number");
//    }

    public ATM(){
        selectAccount();
    }

    public void selectAccount(){
        System.out.println("Please select the account you want to access");
        System.out.println("Type 1 - Check Debit Account");
        System.out.println("Type 2 - Check Savings Account");
        System.out.println("Type 3 - Exit");
        this.pick = nextInt();
    }
}
