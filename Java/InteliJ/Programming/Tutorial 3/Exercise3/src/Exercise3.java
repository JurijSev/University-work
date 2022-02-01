public class Exercise3 {
    public static void main(String[] args) {
        int n = 5;
        int total=0;
        if(n>0){
            sum(n,0,total);
        }else{
            System.out.println(0);
        }
    }
    public static void sum(int x,int y,int total ){
        int z = y;
        if(z<x){
            z++;
            total += z;
        }
        System.out.println(z);
        System.out.println("total is "+total);
        if(z!=x){
            sum(x, z, total);
        }
    }
}
