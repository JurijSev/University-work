public class Fibonacci {

    public int normalFibonacci(int x){
        if(x ==0){
            return 0;
        }
        if(x ==1){
            return 1;
        }
        return normalFibonacci(x-1)+normalFibonacci(x-2);
    }

    public int fastFibonacci(int n){
        if(n==0) return 0;
        int next;
        int k = 1;
        int prev = 0;
        int x = 1;
        while(k<n){
            next = x+prev;
            prev = x;
            x = next;
            k = k+1;
        }
        return x;
    }

    public static void main(String[] args) {
        Fibonacci fibonacci = new Fibonacci();
        int output1 = fibonacci.normalFibonacci(4);
        int output2 = fibonacci.fastFibonacci(6);
        System.out.println("The results are: "+output1+","+output2);
    }
}
