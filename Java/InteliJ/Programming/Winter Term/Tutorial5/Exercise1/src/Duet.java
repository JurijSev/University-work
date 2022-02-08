public class Duet {
    Singer singer1;
    Singer singer2;

    public Singer getSinger1() {
        return singer1;
    }

    public Singer getSinger2() {
        return singer2;
    }

    public void setSinger1(Singer singer1) {
        this.singer1 = singer1;
    }

    public void setSinger2(Singer singer2) {
        this.singer2 = singer2;
    }

    public Duet(Singer singer1, Singer singer2) {
        this.singer1 = singer1;
        this.singer2 = singer2;
    }

    public boolean bothProfessional(){
        boolean both = false;
        if(singer1.getProfessional() && singer2.getProfessional()){
            both = true;
        }
        return both;
    }
}
