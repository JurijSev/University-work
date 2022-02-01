import java.util.Scanner;
public class Exercise10 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("Please enter a string;");
        String a = sc.next();
        System.out.println("Please enter another string");
        String b = sc.next();
        char[] aArray = a.toCharArray();
        //System.out.println(aArray);
        for(int i =1;i<=aArray.length;i++){
            //System.out.print(aArray.get(i));
        }
    }
}
