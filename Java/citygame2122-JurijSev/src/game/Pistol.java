package game;

public class Pistol extends BackpackItem{

    public Pistol(Vinni vinni) {
        super(vinni);
    }


    @Override
    public String getType() {
        return "Pistol";
    }

    @Override
    public void operate() {
        //vinni.shoot
    }


}
