import java.lang.reflect.Array;
import java.util.ArrayList;

public class Exercise8 { //QuickSort
    public static void main(String[] args) {
        int[] array = {4,6,2,3,6,7,8,8,3,4,2};
        //System.out.println();
        quickSort(array);
    }
    public static void quickSort(int[] array){
        int pivot = array[array.length-1];
        //int pivot2 = array2[array2.length-1];
        ArrayList<Integer> less = new ArrayList<Integer>();
        ArrayList<Integer> more = new ArrayList<Integer>();
//        ArrayList<Integer> less2 = new ArrayList<Integer>();
//        ArrayList<Integer> more2 = new ArrayList<Integer>();
        //System.out.print(pivot);
        for(int i=0;i< array.length-1;i++){
            if(array[i] <pivot){
                less.add(array[i]);
            }else{
                more.add(array[i]);
            }
        }
        less.add(pivot);
        System.out.println("Less : "+less);
        System.out.println("More : "+more);


        int[] arrayMore = new int[more.size()];
        int[] arrayLess = new int[less.size()];

        int index = 0;
        int index2 = 0;
        for(int val:more){
            arrayMore[index++] = val;
        }
        for(int val:less){
            arrayLess[index2++] = val;
        }
        System.out.println(pivot);
        for(int i=0;i< arrayLess.length;i++){
            System.out.print(arrayLess[i]+", ");
        }
        System.out.println(" and ");
        for(int i=0;i< arrayMore.length;i++){
            System.out.print(arrayMore[i]+", ");
        }
        System.out.println("");

        boolean sortedLess = false, sortedMore = false;

        if(sortedLess == false){
            int count2 =0;
            for(int i =1;i<arrayLess.length;i++){
                if(sortedLess == true){
                    break;
                }
                if(arrayLess[i-1]>arrayLess[i]){
                    count2++;
                }
                i++;
            }
            System.out.println("count2 = "+count2);
            if(count2>0){
                sortedLess = false;
            }else{
                sortedLess = true;
            }
        }
        if(sortedMore == false){
            int count = 0;
            for(int j = 1;j<arrayMore.length;j++){
                if(sortedMore == true){
                    break;
                }
                if(arrayMore[j--]>arrayMore[j]){
                    count++;
                }
                j++;
            }
            if(count>0){
                sortedMore = false;
            }else{
                sortedMore = true;
            }
        }
        //boolean bothSorted = false;
        if(sortedLess == false){
            System.out.println("sorting Less");
            quickSort(arrayLess);
        }else{
            System.out.println("Sorted Less is sorted");

            if(sortedMore == false){
                System.out.println("sorting More");
                quickSort(arrayMore);
            }else{
                System.out.println("Sorted More is sorted");
            }
        }
//        if(sortedMore == false){
//            System.out.println("sorting More");
//            quickSort(arrayMore);
//        }else{
//            System.out.println("Sorted More is sorted");
//        }
//        if(sortedLess && sortedMore){
//            for(int i = 0;i<arrayLess.length;i++){
//                System.out.print(arrayLess[i]+",");
//            }
//            for(int i = 0;i<arrayMore.length;i++){
//                System.out.print(arrayMore[i]+",");
//            }
            //bothSorted = true;
            /// I NEED TO CONCATONATE THE smaller and larger array. Then return the new array;
        //}


    }
}
