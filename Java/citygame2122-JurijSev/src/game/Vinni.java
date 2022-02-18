package game;

import city.cs.engine.*;

public class Vinni extends Walker {
    private static final Shape vinniShape = new PolygonShape(
            -0.87f,1.95f,
            1.01f,1.69f,
            1.33f,1.21f,
            1.34f,-0.81f,
            0.37f,-1.79f,
            -0.58f,-1.68f,
            -1.6f,-0.35f,
            -1.27f,1.7f);

    private static final BodyImage standingImage = new BodyImage("data/front.png", 4f);
    //public static final BodyImage walkRightImage = new BodyImage("data/right.png", 4f);

    private int credits;

    public Vinni(World world) {
        super(world, vinniShape);
        addImage(standingImage);
        credits = 0;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

}
