public class Collatz {
    private int pick;
    private int[] last = new int[6];
    private static int count = 0;

    public Collatz(int pick) {
        this.pick = pick;
        oddOrEven();
        System.out.println(this.pick);
        System.out.println(this.count-3 +" steps until loop 4,2,1 found");

    }

    private void oddOrEven(){
        this.count++;
        System.out.print(this.pick+", ");
        if(this.pick%2!=0) {
            this.pick*=3;
            this.pick++;
        }else{
            this.pick/=2;
        }
        if(!lastPositions()){
            oddOrEven();
        }

    }

    private boolean lastPositions(){
        boolean lastPos = false;
        last[0] = last[1];
        last[1] = last[2];
        last[2] = last[3];
        last[3] = last[4];
        last[4] = last[5];
        last[5] = this.pick;

        if(last[0]==last[3] && last[1] == last[4] && last[2]==last[5]){
            lastPos = true;
        }
        return lastPos;
    }
}
