public class Quatuor {
    private Duet duet1;
    private Duet duet2;

    Quatuor(Duet duet1, Duet duet2){
        this.duet1 = duet1;
        this.duet2 = duet2;
    }

    public void setDuet1(Duet duet){
        this.duet1 = duet;
    }
    public void setDuet2(Duet duet){
        this.duet2 = duet;
    }
    public Duet getDuet1(){
        return duet1;
    }
    public Duet getDuet2(){
        return duet2;
    }
}
