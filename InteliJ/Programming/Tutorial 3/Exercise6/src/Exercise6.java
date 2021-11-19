import java.util.Scanner;
public class Exercise6 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int input = 4;
//        triangle1(input,0);
//        System.out.println("-------");
//        triangle2(input,0);
//        System.out.println("-------");
//        triangle3(input,0);
//        System.out.println("-------");
        boat(input,0);
    }
    public static void triangle1(int n,int i){
        int j = 0;
        while (i < n) {
            int k = n-1;
            while(k>=0){
                System.out.print(" ");
                k--;
            }
            while(j<=i){
                System.out.print("*");
                j++;
            }
            j=0;
            System.out.print("\r\n");
            i++;
        }
    }
    public static void triangle2(int n, int i){
        int j = n;
        while (i < n) {
            int k = n-1;
            while(k>=0){
                System.out.print(" ");
                k--;
            }
            while(j>i){
                System.out.print("*");
                j--;
            }
            j=n;
            System.out.print("\r\n");
            i++;
        }
    }
    public static void triangle3(int n, int i){
        int j = n*2;
        while (i <= n*2) {
            int k = i;
            while(k>0){
                System.out.print(" ");
                k-=2;
            }
            while(j>i){
                System.out.print("*");
                j--;
            }
            j=n*2;
            System.out.print("\r\n");
            i+=2;
        }
    }
    public static void boat(int n, int i){
        triangle1(n,i);
        triangle2(n,i);
        triangle3(n,i);
    }
}
