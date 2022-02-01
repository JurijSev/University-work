import java.util.Arrays;
public class task3 {
    public static void main(String[] args) {
        //Student S1 = new Student("bob", 1234, new int[]{0,0,0,0,0,0,0,0,0,0});
        Student S1 = new Student("bob", 1234);
        Student S2 = new Student("ben", 1324);
        Group G1 = new Group(S1.name, S1.IDnumber,S2.name,S2.IDnumber);
        //System.out.println();
        System.out.println(S1.returnMarks());
    }
}
