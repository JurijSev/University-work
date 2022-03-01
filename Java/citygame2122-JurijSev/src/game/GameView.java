package game;

import city.cs.engine.UserView;
import org.jbox2d.common.Vec2;

import javax.swing.*;
import java.awt.*;

public class GameView extends UserView {

    private Image sky;
    private Image grass;

    public GameView(GameWorld world, int width, int height) {
        super(world, width, height);
        sky = new ImageIcon("data/Background/blueSky.jpg").getImage();
        grass = new ImageIcon("data/Background/Grass.png").getImage();
        this.setCentre(new Vec2(world.getVinni().getPosition().x, world.getVinni().getPosition().y));
    }


    @Override
    protected void paintBackground(Graphics2D g) {
        g.drawImage(sky, 0, 0,500,500, this);
        g.drawImage(grass, -100, 100,1000,500, this);

    }
//    @Override
//    protected void paintForeground(Graphics2D g){
//        g.drawImage(grass, -100, 100,1000,500, this);
//    }
}
