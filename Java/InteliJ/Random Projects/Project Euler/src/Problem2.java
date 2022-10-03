public class Problem2 {
    private int prevNum;
    private int nextNum;
    private int temp;
    private int count;

    public Problem2(){
        prevNum=1;
        nextNum=1;
        temp=0;
        count=0;
        while(nextNum<4000000){
            if(nextNum%2==0){
                count=count+nextNum;
            }
            temp=nextNum;
            nextNum=nextNum+prevNum;
            prevNum=temp;
        }
        System.out.println(count);


    }

    public static void main(String[] args){
        new Problem2();
    }
}
