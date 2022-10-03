public class Problem3 {

    public Problem3(){
        long number = 6008514751L;
        long target = number;
//        for(long i = 0; i<(target); i++){
//            System.out.println(i);
//            for(long j = 1; j<(target); j++){
//                if(i*j== number){
//                    //System.out.println(i+" , "+j);
//                    target =j;
//                }
//            }
//        }

        boolean flag = false;
        long count = 0;
        for(long i=1;i<number/2;i++){
            count=0;
            for(long j=2;j<=i;j++){
                if(i%j==0){
                    flag=true;
                    count++;
                }
                if(count>1){
                    j=i+1;
                }
            }
            if(count==1){
                System.out.println(i);
                for(long j=2;j<number/2;j++){
                    if(i*j==number){
                        System.out.println("Found"+i);
                    }
                }
            }

        }


//        for(long i=2;i<number;i++){
//            if(target % i ==1){
//                System.out.println(i);
//            }
//        }




    }
    public static void main(String[] args){
        new Problem3();
    }
}
///i123