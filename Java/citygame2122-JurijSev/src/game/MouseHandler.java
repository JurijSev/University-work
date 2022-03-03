package game;

import city.cs.engine.CircleShape;
import city.cs.engine.DynamicBody;
import org.jbox2d.common.Vec2;

import java.awt.*;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

public class MouseHandler implements MouseListener {

    private GameView view;
    private GameWorld world;

    public MouseHandler(GameWorld world,GameView v){
        this.world = world;
        this.view = v;
    }

    @Override
    public void mouseClicked(MouseEvent e) {
    }

    @Override
    public void mousePressed(MouseEvent e) {
        //CircleShape circleShape = new CircleShape(1f);
        //DynamicBody ball = new DynamicBody(world, circleShape);
        //Point mousePoint = e.getPoint();
        //Vec2 worldPoint = view.viewToWorld(mousePoint);
        //ball.setPosition(worldPoint);
    }

    @Override
    public void mouseReleased(MouseEvent e) {
    }

    @Override
    public void mouseEntered(MouseEvent e) {
    }

    @Override
    public void mouseExited(MouseEvent e) {

    }
}
