package game;

import city.cs.engine.AttachedImage;
import city.cs.engine.BodyImage;
import org.jbox2d.common.Vec2;

public abstract class BackpackItem {

    protected Vinni vinni;
    protected BodyImage image;

    protected AttachedImage aImage;

    public BackpackItem(Vinni vinni){
        this.vinni = vinni;
    }

    public void putOn(){
        aImage = vinni.addImage(image);
        aImage.setOffset(new Vec2(1,0));
        aImage.flipHorizontal();
    }

    public void takeOff(){
        vinni.removeAttachedImage(aImage);
    }


    public abstract String getType();

    public abstract void operate();
}
