import java.util.ArrayList;
import java.util.Scanner;
public class Exercise7 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("Please enter an integer");
        int n = sc.nextInt();
        ArrayList<Integer> as = new ArrayList<>();
        System.out.println(n);
        for(int i = 0;i<n;i++){
            System.out.println("Please enter a value");
            as.add(sc.nextInt());
        }
        for(int j = n-1;j>=0;j--){
            System.out.print(as.get(j));
        }
        //System.out.println(as);
    }
}
