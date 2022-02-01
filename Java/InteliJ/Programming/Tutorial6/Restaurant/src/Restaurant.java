public class Restaurant {
    String name;
    int numberOfTables;
    private static int numberOfRestaurants;

    {
        System.out.println("Welcome to the new restaurant");
    }

    static{
        System.out.println("Welcome");
    }

    Restaurant(String newName){
        this.name = newName;
        this.numberOfTables = 10;
        incrementNumberOfRestaurants();
    }

    public static int getNumberOfRestaurants() {
        return numberOfRestaurants;
    }

    public static void setNumberOfRestaurants(int numberOfRestaurants) {
        Restaurant.numberOfRestaurants = numberOfRestaurants;
    }

    private static void incrementNumberOfRestaurants(){
        ++numberOfRestaurants;
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
