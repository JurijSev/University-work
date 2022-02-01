import java.util.Scanner;
public class Exercise4 {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        String month = sc.next();
        Boolean declared = false;
        while(declared !=true){
            switch(month.toLowerCase()){
                case "january":
                    System.out.println("1");
                    declared = true;
                    break;

                case "feburary":
                    System.out.println("2");
                    declared = true;
                    break;
                case "march":
                    System.out.println("3");
                    break;
                    declared = true;
                case "april":
                    System.out.println("4");
                    break;
                    declared = true;
                case "may":
                    System.out.println("5");
                    break;
                    declared = true;
                case "june":
                    System.out.println("6");
                    break;
                    declared = true;
                case "july":
                    System.out.println("7");
                    break;
                    declared = true;
                case "august":
                    System.out.println("8");
                    break;
                    declared = true;
                case "september":
                    System.out.println("9");
                    break;
                    declared = true;
                case "october":
                    System.out.println("10");
                    break;
                    declared = true;
                case "november":
                    System.out.println("11");
                    break;
                    declared = true;
                case "december":
                    System.out.println("12");
                    break;
                    declared = true;
                default:
                    System.out.println("not a month, check spelling");
                    month = sc.next();
                    break;
            }
        }


    }
}
