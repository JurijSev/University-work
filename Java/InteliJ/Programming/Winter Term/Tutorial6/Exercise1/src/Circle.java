import java.lang.Math;
public class Circle {
    private int radius;
    static final double PI = 3.14; //cannot be changed
    private static int numberOfCircles =0;
    private static double totalSurface = 0;

    public Circle(int radius) {
        this.radius = radius;
        numberOfCircles++;

        totalSurface += area();
    }

    public Circle(){
        this.radius = 1;
        numberOfCircles++;
        totalSurface += area();
    }

    public static int getNumberOfCircles() {
        return numberOfCircles;
    }

    public static void setNumberOfCircles(int numberOfCircles) {
        Circle.numberOfCircles = numberOfCircles;
    }

    public static double getTotalSurface() {
        return totalSurface;
    }

    public static void setTotalSurface(double totalSurface) {
        Circle.totalSurface = totalSurface;
    }

    public int getRadius() {
        return radius;
    }

    public void setRadius(int radius) {
        if(radius>0){
            this.radius = radius;
        }
    }

    private double area(){
        return (Math.pow(this.radius,2)*PI);
    }
}
