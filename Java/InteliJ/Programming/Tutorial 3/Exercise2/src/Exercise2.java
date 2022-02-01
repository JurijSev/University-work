public class Exercise2 {
    public static void main(String[] args){
        int a = 17;
        int b = 43;
        int meanA = arithmeticMean(a,b);
        int meanG = geometricMean(a,b);
        if(meanA>meanG){
            System.out.println("True");
        }else{
            System.out.println("False");
        }
    }
    public static int arithmeticMean(int x,int y){
        int aMean = (x+y)/2;
        return aMean;
    }
    public static int geometricMean(int x, int y){
        int gMean = (int)Math.sqrt(x*y);
        return gMean;
    }
}
