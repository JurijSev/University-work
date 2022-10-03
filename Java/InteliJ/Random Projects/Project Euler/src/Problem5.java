public class Problem5 {

    public Problem5(){
        long number = 600851475143L;
        long target = number;
        for(int i = 2; i<(target-i); i++){
            System.out.println(i);
            for(int j = 1; j<(target-i); j++){
                System.out.println(i+","+j);
                if(i*j== number){
                    System.out.println(i+" , "+j);
                    target =j;
                }
            }
        }
    }
    public static void main(String[] args){
        new Problem5();
    }
}
///123000