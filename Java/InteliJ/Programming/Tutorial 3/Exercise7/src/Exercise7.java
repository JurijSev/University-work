import java.util.ArrayList;
import java.util.Scanner;
public class Exercise7 {//fibonacci
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ArrayList <Integer> F = new ArrayList<Integer>();
        F.add(0);
        F.add(1);
        System.out.println("Please enter a value");
        int input = sc.nextInt();
        //FN(input,0);
        for(int i=2;i<=input;i++){
            F.add(F.get(i-1)+F.get(i-2));

        }
        System.out.print("This is the fibonacci sequence up to that index: ");
        for(int i = 0;i<F.size();i++){
            if(i==F.size()-1){
                System.out.print(F.get(i));
            }else{System.out.print(F.get(i)+", ");}

        }
    }

//    public static void FN(int i, int z){
//        int j = 2;
//       ArrayList <Integer> K = new ArrayList<Integer>();
//       K.add(0);
//       K.add(1);
//        //System.out.print(i);
//        while(j<i){
//            K.add(K.get(j-1)+K.get(i-2));
//            j++;
//        }
//    }
}
