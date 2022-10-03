public class PowerTest {
    public int power(int x, int k) {
        int y;
        if(k<=0){
            return 1;
        }else{
            y = power(x,k-1);
            return x*y;
        }

    }

    public int fastPower(int x, int k) {
        int y;
        if(k==0){
            return 1;
        }
        y = fastPower(x, k/2);
        if(k % 2 ==0){
            return y*y;
        }else{
            return y*y*x;
        }
    }

    public static void main(String[] arg) {
        PowerTest powerTest = new PowerTest();
        int output1 = powerTest.power(2,7);
        int output2 = powerTest.fastPower(2,7);
        System.out.println("The results are: " + output1 + " , " + output2);
    }
}
