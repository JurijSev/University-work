public class OOPLecture1 {
    public static void main(String[] args) {
        String aName = "Maryan";
        Student[] students = {
                new Student("Dave",123),
                new Student(aName,124);
        }
        Student aStudent = students[1];
    }
}

public class Student{
    String name;
    int studentNumber;
    void Student(String newName, int newNum){
        name = newName;
        studentNumber = newNum;
    }
}
