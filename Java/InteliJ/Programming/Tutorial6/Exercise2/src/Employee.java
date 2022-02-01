public class Employee {
    private String name;
    private Job job;
    private Company company;

    public Employee(String name, Job job, Company company) {
        this.name = name;
        this.job = job;
        this.company = company;
        company.incrementNumberOfEmployees();
        company.setListOfEmployees(addEmployeeList(company.getListOfEmployees(),this ));
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Employee[] addEmployeeList(Employee[] t, Employee e){
        Employee[] s = new Employee[t.length+1];
        for(int i =0; i<t.length;i++){
            s[i] = t[i];
        }
        s[t.length] = e;
        return s;
    }
}
