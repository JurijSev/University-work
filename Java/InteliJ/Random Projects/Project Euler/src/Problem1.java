public class Problem1 {
    public int limit;
    public int count;

    public Problem1(){
        limit = 1000;
        count = 0;
        for(int i=1; i<limit; i++){
            if(i%3==0 || i%5==0) {
                count=count+i;
                System.out.println(i);
                System.out.println(count);
            }
        }

    }

    public static void main(String[] args){
        new Problem1();
    }

}



