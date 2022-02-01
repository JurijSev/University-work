public class Test {
    public static void main(String[] args) {
        Job manager = new Job("manager",3000);
        Job canineTherapist = new Job("canine therapist",3000);
        Company myCompany = new Company("myCompany",0,new Employee[0]);
        Employee Jurij = new Employee("Jurij",manager,myCompany);
        Employee Lily = new Employee("Lily",canineTherapist, myCompany);
        System.out.println(myCompany.getNumberOfEmployees());
        printWages(myCompany);
    }
    public static void printWages(Company company){
        for(int i=0;i<company.getNumberOfEmployees();i++){
            System.out.println(company.getSpecificEmployee(i).getName()+": "+company.getSpecificEmployee(i).getJob().getWage());
        }
    }
}
