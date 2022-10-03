public class PrintDuplicates{
    public boolean PrintDuplicatesAlg(int[] a){
        int i = 0;
        while (i < 0){
            boolean duplicate = BinarySearch(a,a[i]);
            if(duplicate){
                return true;
            }else{
                return false;
            }
        }
        
    }

    private boolean BinarySearch(int[] a, int t){
        int lo = 0;
        int hi = 0;
        int mid = 0;
        while (lo <= hi){
            mid = (lo+hi)/2;
            if (a[mid] == t){
                return true;
            }
            if (a[mid] <t){
                lo = mid +1;
            }else{
                hi = mid-1;
            }
        }
        return false;
    }

    public static void main(String[] args) {
        PrintDuplicates printDuplicates = new PrintDuplicates();
        int[] a = {1,2,3,4,5,6,7,7,8,9};
        boolean test = printDuplicates.PrintDuplicatesAlg(a);
        System.out.println(test);
    }
}
