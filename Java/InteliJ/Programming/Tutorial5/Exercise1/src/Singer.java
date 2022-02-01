public class Singer {
    private String name;
    private int age;
    private boolean professional;

    Singer(String newName, int newAge){
        this.name = newName;
        this.age = newAge;
        this.professional = true;

    }

    public String getName(){
        return this.name;
    }
    public int getAge(){
        return this.age;
    }

    public boolean getProfessional(){
        return this.professional;
    }

    public void setAge(int newAge){
        if(newAge>=age){
            this.age = newAge;
        }
    }

    public boolean isAdult(){
        boolean adult = false;
        if(age>=18){
            adult ^= true;
        }
        return adult;
    }

    public void reverseProfessional(){
        this.professional ^= true;
    }

}
