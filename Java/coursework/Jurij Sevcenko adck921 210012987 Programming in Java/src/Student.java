public class Student {          //Create Student class - Question 1
    private String name;            //Initialise name String variable
    private int studentNumber;      //Initialise studentNumber int variable
    private Boolean passJava;       //Initialise passJava boolean variable

    public Student(String name, int studentNumber) {        //Initialise constructor for class Student
        this.name = name;                           //Set name to provided name
        this.studentNumber = studentNumber;         //Set studentNumber to provided studentNumber
        this.passJava = false;                      //Set passJava to false
    }

    public String getName() {
        return name;
    }       //Initialise getter for name

    public int getStudentNumber() {
        return studentNumber;
    }       //Initialise getter for studentNumber

    public boolean isPassJava() {
        return passJava;
    }       //Initialise getter for passJava

    public void setName(String name) {
        this.name = name;
    }       //Initialise setter for name

    public void setStudentNumber(int studentNumber) {       //Initialise setter for studentNumber
        this.studentNumber = studentNumber;
    }

    public void setPassJava(boolean passJava) {     //Initialise setter for passJava
        this.passJava = passJava;
    }
}
