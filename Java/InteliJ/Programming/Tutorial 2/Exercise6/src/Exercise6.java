import java.util.ArrayList;
import java.util.Scanner;
public class Exercise6 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("Please enter a value");
        int n = sc.nextInt();
        ArrayList<Integer> as = new ArrayList<Integer>();
        int total = 0;
        for(int i=0;i<n;i++){
            System.out.println("Please enter a new value");
            as.add(sc.nextInt());
        }
        System.out.println("First element: "+as.get(0));
        for(int j =0;j<n;j++){
            if(j%2 == 0){
                total += as.get(j);
            }else{
                total -=as.get(j);
            }
            System.out.println(total);
        }
        System.out.println(as);
        System.out.println(total);
    }
}
