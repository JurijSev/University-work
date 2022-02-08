public class Exercise5 {
    public static void main(String[] args){
        int[] array = {1,2,3,4,5,6,7,8,9,10,11,15,13,14};
        for (int i=0;i<array.length;i++){

            for (int j=1;j<array.length-i;j++){

                if (array[j-1]>array[j]){

                    int tmp = array[j];

                    array[j] = array[j-1];

                    array[j-1] = tmp;

                }

            }

        }
    }
}
