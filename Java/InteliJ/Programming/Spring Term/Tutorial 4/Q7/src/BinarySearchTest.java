public class BinarySearchTest{

        public int binarySearch(int[] a, int k) {
            int lo =0;
            int hi = a.length-1;
            int mid;

            while (lo<=hi){
                mid = ((lo+hi)/2);
                if(a[mid]<k){
                    lo=mid+1;
                }else{
                    hi=mid-1;
                }
            }
            return lo;
        }

        public static void main(String[] arg) {
            BinarySearchTest binarySearchTest = new BinarySearchTest();
            int[] data = {-2,0,4,6,11,13,14,22,29,87,103};
            int key = 87;
            int output = binarySearchTest.binarySearch(data,11);
            System.out.println("The key can be found in position " + output + " (where -1 indicates not present)");
            System.out.println("So the key is on position "+ (output+1) +".");
            //note that the second variation returns the index above where the data would be placed if not present
        }

}

