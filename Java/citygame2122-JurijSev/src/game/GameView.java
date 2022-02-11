package game;

import city.cs.engine.UserView;

import javax.swing.*;
import java.awt.*;

public class GameView extends UserView {

    private Image background;

    public GameView(GameWorld world, int width, int height) {
        super(world, width, height);
        background = new ImageIcon("data/taiga.jpeg").getImage();
    }

    @Override
    protected void paintBackground(Graphics2D g) {
        g.drawImage(background, -100, 0,700,500, this);
    }
}
