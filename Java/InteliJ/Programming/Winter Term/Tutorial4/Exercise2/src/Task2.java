public class Task2 {
    public static void main(String[] args) {
        Sportperson bob = new Sportperson("bob", "rugby");
        System.out.println(bob.name+ bob.age+ bob.sport);
        bob.incrementAge(25);
        System.out.println(bob.name+ bob.age+ bob.sport);
    }
}
