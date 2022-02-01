public class Task1 {
    public static void main(String[] args) {
        Film film1 = new Film("The one", 2021, 90, 0);
        System.out.println(film1.title);
        //duration
        System.out.println(film1.duration);
        film1.updateDuration(60);
        System.out.println(film1.duration);
        //increment tickets
        System.out.println(film1.soldTickets);
        film1.increment();
        System.out.println(film1.soldTickets);
    }
}
