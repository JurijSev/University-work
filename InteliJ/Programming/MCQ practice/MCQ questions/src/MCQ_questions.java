public class MCQ_questions {
    public static void main(String[] args) {
        System.out.println(isWeekday("Wed"));
        example1();
        example2();
        example3();
        example4();
        example5();
    }

    public static void example1(){
        System.out.println("Example1:");
        int[] t = {0,0,0,0};
        int x = 1;
        update(t,x);
        System.out.println("t[0] = "+t[0]);
        System.out.println("x = "+x);
    }
    public static void example2(){
        System.out.println("Example2:");
        int x = 8;
        int y = 12;
        boolean a = (x>y);
        boolean b = (x+8<y);
        System.out.println((!a ||!b)&&(!(a||b)));
    }
    public static void example3(){
        System.out.println("Example3");
        int[] a = {0,1,2,3};
        int i = 0;
//        while(i<a.length){
//            a[i] = a[i-1]+1;
//            i++;
//        }
        //System.out.println(a[2]);
        System.out.println("Produces Error");
    }
    public static void example4(){
        System.out.println("Example4:");
        int[][] t = {{2,3,3},{2,1},{3,1,3,3}};
        int x=0;
        count:
            for(int i = 0;i<t.length;i++){
                for(int j=0;j<t[i].length;j++){
                    if(t[i][j]==3){
                        x++;
                        continue count;
                        // this essentially increments i and resets j -
                        // so it doesn't carry on looking through the element to find 3s
                    }
                }
            }
        System.out.println(x);
    }
    public static void example5(){
        System.out.println("Example5:");
        for(int i=0;i<6;i++){
            int[] a=new int[4];
            int[][] b = {a,a,a};
            int[][] c = b;
        }
        System.out.println("");

    }
    public static void update(int[] t, int x){
        x++;
        //System.out.println(x);
        t[0]=x;
        t =new int[] {4,4,4};
    }
    public static boolean isWeekday(String d){
        boolean result = true;
        switch (d){
            case "Sat": case "Sun":
                result = false;
            case "Mon": case "Tue": case "Wed": case "Thu": case "Fri":
                break;
            default:
                throw new Error(d+" not recognised");
        }
        return result;
    }
}
