public class Car {
    String model;
    int speed;
    double miles;

    Car(String newModel, int newSpeed, double newMiles){
        model = newModel;
        speed = newSpeed;
        miles = newMiles;
    }

    void updateSpeed(int newSpeed){
        speed = newSpeed;
    }
    void updateMiles(double newMiles){
        miles = newMiles;
    }

}
