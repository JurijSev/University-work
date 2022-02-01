import java.util.Scanner;
public class Exercise9 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("Please enter a positive integer");
        int n = sc.nextInt();
        while(n !=1){
            if(n%2==0){
                n=n/2;
                System.out.println(n);
            }else if(n%2>0){
                n=n*3;
                n++;
                System.out.println(n);
            }
        }

    }
}
