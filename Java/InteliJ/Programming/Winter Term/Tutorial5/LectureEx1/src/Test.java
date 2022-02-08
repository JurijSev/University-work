public class Test {
    public static void main(String[] args) {
        Restaurant rest1 = new Restaurant("Barn");
        System.out.println(rest1.getName());
        System.out.println(rest1.getNumberOfTables());
        rest1.setName("Barn Cafe");
        rest1.setNumberOfTables(12);
        System.out.println(rest1.getName());
        System.out.println(rest1.getNumberOfTables());
    }
}
