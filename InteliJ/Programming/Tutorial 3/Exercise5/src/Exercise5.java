public class Exercise5 {
    public static void main(String[] args) {
        int[] array = {45,3,12,6};
        int meanA = aMean(array);
        int meanG = gMean(array);
        if(meanA>meanG){System.out.println("True");
        }else{System.out.println("The mean values are equal");}
    }
    public static int aMean(int[] array){
        int total = 0;
        for(int i = 0;i<array.length;i++){
            total = total+array[i];
        }
        int mean = total/ (array.length);
        return mean;
    }
    public static int gMean(int[] array){
        double total = 1;
        for(int i = 0;i<array.length;i++){
            total = total*array[i];
        }
        double mean = Math.pow((total),1/(double)array.length);
        int meanRounded = (int) Math.round(mean);
        return meanRounded;
    }
}
