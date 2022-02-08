public class Test {
    public static void main(String[] args) {
        Circle a = new Circle(1);
        System.out.println(a.getRadius());
        System.out.println(a.getTotalSurface());
        Circle b = new Circle(5);
        System.out.println(a.getRadius());
        System.out.println(a.getTotalSurface());
        Circle c = new Circle(8);
        System.out.println(a.getRadius());
        System.out.println(a.getTotalSurface());
    }
}
