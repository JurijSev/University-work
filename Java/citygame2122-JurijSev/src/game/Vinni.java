package game;

import city.cs.engine.*;

public class Vinni extends Walker {
    private static final Shape vinniShape = new BoxShape(1.5f,1.8f);

    private static final BodyImage image = new BodyImage("data/front.png", 4f);

    private int credits;

    public Vinni(World world) {
        super(world, vinniShape);
        addImage(image);
        credits = 0;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

}
