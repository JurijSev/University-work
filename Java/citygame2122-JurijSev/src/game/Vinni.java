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

    public static final BodyImage standingImageRight = new BodyImage("data/Vinni/front.png", 4f);
    //public static final BodyImage standingImageLeft = new BodyImage("data/Vinni/front2.png", 4f);

    private int credits;

    private String direction;

    private Backpack backpack = new Backpack();

    public Backpack getBackpack(){
        return backpack;
    }

    public Vinni(World world) {
        super(world, vinniShape);
        addImage(standingImageRight);
        credits = 0;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }


}
