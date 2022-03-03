package game;

import org.jbox2d.common.Vec2;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

public class DirectionalThrowing implements MouseListener {

    private Vinni vinni;
    private GameView view;

    public DirectionalThrowing(Vinni v, GameView gameView){
        vinni = v;
        view = gameView;
    }

    @Override
    public void mouseClicked(MouseEvent e) {
        Vec2 worldPoint = view.viewToWorld(e.getPoint());
        vinni.throwPot(worldPoint);
    }

    @Override
    public void mousePressed(MouseEvent e) {

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
