public class FooTestQ1 {



    public int foo(int[] a){
        int count = 0;
        int target = 0;
        int i=0;

        while (i<a.length){
            if(a[i]==target){
                count++;
            }
            i++;
        }
        return count;
    }

    public static void main(String[] args){
        FooTestQ1 fooTestQ1 = new FooTestQ1();
        int[] data = {2,7,0,8,0};
        int output = fooTestQ1.foo(data);
        System.out.println("The array contains "+ output+ " occurrences of 0.");
    }
}
