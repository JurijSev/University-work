public class Defining_Methods {
    public static void main(String[] args){
        //System.out.println("Hello");
        int x = 1;
        int y = increment(x); //You must add a declaration "x=" for any value to change
        System.out.println(y+","+x);
    }
    public static int increment(int x){
        x++;
        return (x);
    }
}
