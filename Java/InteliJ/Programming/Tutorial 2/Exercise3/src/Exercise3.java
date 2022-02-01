import java.util.Scanner;
public class Exercise3 {
    public static void main(String[] args){
        int n = getIntFromUser("Enter an in");
        while(n>=0){
            System.out.println("Enter a new val");
            n=sc.nextInt();
        }
        System.out.println(n);
    }

    public static int getIntFromUser(String message){
        Scanner sc = new Scanner(System.in);
        System.out.println(message);
        int n = sc.nextInt();
        return n;
    }
}
