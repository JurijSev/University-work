public class Restaurant {
    String name;
    int numberOfTables;

    {
        System.out.println("Welcome to the new restaurant");
    }
    Restaurant(String newName){
        this.name = newName;
        this.numberOfTables = 10;
    }
    public String getName(){
        return name;
    }
    public int getNumberOfTables(){
        return numberOfTables;
    }
    public void setName(String nameChange){
        this.name = nameChange;
    }

    public void setNumberOfTables(int newTableNum){
        if(newTableNum>0){
            this.numberOfTables = newTableNum;
        }
    }
}
