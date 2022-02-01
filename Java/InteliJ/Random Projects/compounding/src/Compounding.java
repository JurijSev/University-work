import java.math.BigInteger;

public class Compounding {
    public static void main(String[] args) {
        double amount = 1;
        double change = 1.05;
        int days = 30;
        String value = "";
        double valueAfterTime = 0;
        double finalValue =0;

        for(int i=0;i<days;i++){
            amount = (amount*change);
            System.out.println(amount);
        }
        valueAfterTime = amount;

        if(value =="Penny"){
            finalValue= valueAfterTime/100;
        }

        System.out.println("£"+finalValue+".00");
        System.out.println(finalValue-3000000);
    }
}
