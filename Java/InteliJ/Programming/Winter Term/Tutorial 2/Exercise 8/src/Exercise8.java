import java.util.Scanner;
public class Exercise8 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("Please enter a number");
        int a = sc.nextInt();
        for(int i = 0;i<=(a*2-1);i+=2){
            for(int j = 0;j<=i;j++){
                System.out.print("*");
            }
            System.out.print("\r\n");
        }
    }
}
