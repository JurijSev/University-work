package game;

import city.cs.engine.*;

public class Vinni extends Walker {
    private static Shape vinniShape = new PolygonShape(
            -1.02f,1.9f,
            0.89f,1.91f,
            1.23f,1.7f,
            1.58f,-0.3f,
            0.6f,-1.76f,
            -0.42f,-1.76f,
            -1.42f,-0.36f,
            -1.35f,1.64f);

    public static final BodyImage standingImageRight =
            new BodyImage("data/Vinni/front.png", 4f);
    public static final BodyImage standingImageLeft =
            new BodyImage("data/Vinni/front2.png", 4f);
    public static final BodyImage walkingGifRight =
            new BodyImage("data/Vinni/VinniRightWalk.gif", 4f);
    public static final BodyImage walkingGifLeft =
            new BodyImage("data/Vinni/VinniLeftWalk.gif", 4f);

    private int credits;

    private String direction;

    private Backpack backpack = new Backpack();

    public Backpack getBackpack(){
        return backpack;
    }

    public Vinni(World world) {
        super(world, vinniShape);
        addImage(standingImageRight);
        direction = "left";
        credits = 0;
    }


    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    public void startWalking(float speed){
        super.startWalking(speed);
        if(speed < 0){
            this.removeAllImages();
            this.addImage(walkingGifLeft);
            direction = "left";
        }else{
            this.removeAllImages();
            this.addImage(walkingGifRight);
            direction = "right";
        }
    }


}
