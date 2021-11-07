import java.util.Scanner;
public class Exercise2 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("Please enter a positive integer");
        int userInp = sc.nextInt(),total =0;
        //loop method
        for(var i=1;i<=userInp;i++){
            total+=i;
            if(i!=userInp){
                System.out.print(i+"+");
            }else{System.out.println(i);}
        }
        System.out.println(total);
        //formula method
        int sum = (userInp*(1+userInp)/2);
        System.out.printf("the total is %d.\n",sum);

    }
}
