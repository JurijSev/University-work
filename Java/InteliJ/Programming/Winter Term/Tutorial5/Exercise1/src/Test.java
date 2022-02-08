public class Test {
    public static void main(String[] args) {
        Singer a = new Singer("Chris", 34);
        if(a.isAdult()){
            System.out.println("Adult");
        }
        Singer b = new Singer("Maria", 30);
        Duet c = new Duet(a,b);
//        System.out.println(c.getSinger1Name()+" and "+c.getSinger2Name());
//        c.setSinger1(b);
//        c.setSinger2(a);
//        System.out.println(c.getSinger1Name()+" and "+c.getSinger2Name());
//        System.out.println(c.getSinger1Age());
//        System.out.println(c.getSinger2Age());
//        System.out.println(c.bothProfessional());
        Singer d = new Singer("Ethan", 19);
        Singer e = new Singer("Lily", 29);
        Duet f = new Duet(d,e);
        Quatuor g = new Quatuor(c,f);
        System.out.println(g.getDuet2().getSinger1().getAge());
    }
}
