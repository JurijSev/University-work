public class Company {
    private String name;
    private int numberOfEmployees = 0;
    private Employee[] listOfEmployees;

    public Company(String name, int numberOfEmployees, Employee[] listOfEmployees) {
        this.name = name;
        this.numberOfEmployees = numberOfEmployees;
        this.listOfEmployees = listOfEmployees;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNumberOfEmployees() {
        return numberOfEmployees;
    }

    public void setNumberOfEmployees(int numberOfEmployees) {
        this.numberOfEmployees = numberOfEmployees;
    }

    public Employee[] getListOfEmployees() {
        return listOfEmployees;
    }

    public Employee getSpecificEmployee(int i){
        return listOfEmployees[i];
    }

    public void setListOfEmployees(Employee[] listOfEmployees) {
        this.listOfEmployees = listOfEmployees;
    }

    public void incrementNumberOfEmployees(){
        ++this.numberOfEmployees;
    }
}
