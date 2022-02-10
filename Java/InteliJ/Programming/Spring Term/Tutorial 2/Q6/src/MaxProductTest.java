public class MaxProductTest {
    public int maxProduct(int[] a){
        int i=0;
        int max = 0;
        int next = 0;
        while(i<a.length){
            if(max<a[i]){
                next = max;
                max = a[i];
            }
            i++;
        }
        return max*next;
    }
    public static void main(String[] arg) {
        MaxProductTest maxProductTest = new MaxProductTest();
        int[] data = {4,12,13,14,5};
        int output = maxProductTest.maxProduct(data);
        System.out.println("The largest multiple of two numbers is " + output);
    }
}
