package game;

import org.jbox2d.common.Vec2;

public class Jetpack extends BackpackItem{

    public Jetpack(Vinni vinni) {
        super(vinni);
    }

    @Override
    public String getType() {
        return "Jetpack";
    }

    @Override
    public void operate() {
        vinni.setLinearVelocity(new Vec2(0,5));
    }
}
