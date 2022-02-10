public class SearchArrayInArray {
    public int search(String[] t, String[] s){
        for(int i=0; i<(t.length-s.length);i++){
            boolean found = true;
            for(int j=i;j<(s.length +i);j++){
                if(t[j] != s[j-i]){
                    found = false;
                    break;
                }
            }
            if(found == true){
                return i;
            }
        }
        return 99;
    }



    public static void main(String[] args) {
        SearchArrayInArray searchArrayInArray = new SearchArrayInArray();
        String[] t = {"a","b","c","b","c","d","c"};
        String[] s = {"b","c","d"};
        int output = searchArrayInArray.search(t,s);
        System.out.println(output);
    }
}
