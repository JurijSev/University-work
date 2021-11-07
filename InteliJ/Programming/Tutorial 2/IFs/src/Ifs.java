import java.util.Scanner;
public class Ifs {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        if(n<5){
            System.out.println("your number is too low");
        }else if(n>=5 && n<10){
            System.out.println("Nice");
        }else{
            System.out.println("Your number is too high");
        }
    }
}
