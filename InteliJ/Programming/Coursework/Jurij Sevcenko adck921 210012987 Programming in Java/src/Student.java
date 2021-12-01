public class Student {      //Create Student class - Question 1
    private String name;
    private int studentNumber;
    private boolean passJava;

    public Student(String name, int studentNumber) {
        this.name = name;
        this.studentNumber = studentNumber;
        this.passJava = false;
    }

    public String getName() {
        return name;
    }

    public int getStudentNumber() {
        return studentNumber;
    }

    public boolean isPassJava() {
        return passJava;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setStudentNumber(int studentNumber) {
        this.studentNumber = studentNumber;
    }

    public void setPassJava(boolean passJava) {
        this.passJava = passJava;
    }
}
