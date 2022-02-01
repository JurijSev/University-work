import java.util.Scanner;
public class Exercise4 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int total = 1;
        if(n>0){
            total = product(n,total);
            System.out.println(total);
        }else{
            System.out.println(0);
        }

    }
    public static int product(int a, int total){
        //int total = 1;
        for(int i = 1; i<=a;i++){
            //System.out.print
            total = total *i;
            //System.out.println(total);
        }
        return total;
    }
}
