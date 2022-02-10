public class SequentialSearch {
    public int seqSearch(int[] a){
        int i =0;
        int target = 14;
        while (i<a.length && a[i]!=target){
            i++;
        }
        return i+1;
    }

    public static void main(String[] args) {
        SequentialSearch sequentialSearch = new SequentialSearch();
        int[] data = {4,12,13,14,5};
        int output = sequentialSearch.seqSearch(data);
        System.out.println("the value is at position "+ output);
    }
}
