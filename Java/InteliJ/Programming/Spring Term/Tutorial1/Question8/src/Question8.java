public class Question8 {
    public static void main(String[] args) {
        Question8 question8 = new Question8();
        int[] array = {27,14,77,85,34,16,58,34,29,39};
        int[] output = question8.algorithmSwap(array);
        for(int i=0; i<array.length;i++){
            System.out.print(array[i]+",");
        }

    }

    public int[] algorithmSwap(int[] a){
        for(int i=0; i<a.length/2;i++){
            int temp=a[i];
            a[i]=a[a.length-1-i];
            a[a.length-1-i]=temp;
        }
        return a;


    }
}
