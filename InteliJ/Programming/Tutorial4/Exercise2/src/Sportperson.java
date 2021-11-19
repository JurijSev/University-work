public class Sportperson {
    String name, sport;
    int age;

    void incrementAge(int i){
        for(int j=1;j<=i;j++){
            age++;
        }

    }

    public Sportperson(String name, String sport) {
        this.name = name;
        this.sport = sport;
        this.age = 0;
    }


}
