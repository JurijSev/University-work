public class Problem4 {


    public Problem4(){
        int a = 999;
        int b = 999;
        int multiple=0;
        int temp = 0;

        boolean found = false;

        for(int i=999;i>100;i--){
            for(int j=999;j>100;j--){
                multiple=a*b;
                String number = String.valueOf(multiple);
                char[] digits = number.toCharArray();
                for(int i1 = 0; i1<digits.length;i1++){
                    if(digits[i1]!=digits[digits.length-1-i1]){
                        i1= digits.length;
                    }
                    if(i1==digits.length-1){
                        //System.out.println(multiple);
                        if(multiple>temp){
                            temp=multiple;
                        }
                    }
                }
                b--;
            }
            a--;
            b=999;
        }
        System.out.println(temp);
    }



    public static void main(String[] args) {

        new Problem4();
    }
}
