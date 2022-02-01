import java.util.Scanner;
public class exercise1 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int n1,n2;
        System.out.println("Enter an integer");
        n1 = sc.nextInt();
        System.out.println("Enter another integer");
        n2 = sc.nextInt();
        if(n1>n2){
            System.out.println("Greater");
        }else{
            System.out.println("Smaller or equal");
        }
    }
}
