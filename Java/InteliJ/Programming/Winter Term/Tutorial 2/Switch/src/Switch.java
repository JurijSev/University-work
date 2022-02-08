import java.util.Scanner;
public class Switch {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("enter the month");
        int month = sc.nextInt();
        String monthString = "null";
        switch(month){
            case 1: monthString = "Jan";
                break;
            case 2: monthString = "Feb";
                break;
            case 3: monthString = "Mar";
                break;
            case 4: monthString = "Apr";
                break;
            case 5: monthString = "May";
                break;
            case 6: monthString = "Jun";
                break;
            case 7: monthString = "Jul";
                break;
            case 8: monthString = "Aug";
                break;
            case 9: monthString = "Sep";
                break;
            case 10: monthString = "Oct";
                break;
            case 11: monthString = "Nov";
                break;
            case 12: monthString = "Dec";
                break;
            default: monthString = "Invalid month";
                break;
        }
        System.out.println(monthString);
    }
}
