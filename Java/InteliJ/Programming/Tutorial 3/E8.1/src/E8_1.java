import java.util.ArrayList;

public class E8_1 {
    public static void main(String[] args) {
        int e = 8;
        ArrayList<Integer> array = new ArrayList<Integer>();
        nextint(array,e);
        arrayIt(array,e);
    }
    public static int nextint(ArrayList<Integer> array, int a){
        int b = a++;
        arrayIt(array,b);
        nextint(b);
    }

    public static int arrayIt(int[] array, int a){
        array.add(a);
    }
}
