package game;

import city.cs.engine.BodyImage;
import city.cs.engine.Walker;

import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

public class VinniController implements KeyListener {

    private static final float WALKING_SPEED = 5;
    private Vinni vinni;
    private GameView view;

    public VinniController(Vinni v, GameView view ) {
        this.vinni = v;
        this.view = view;
    }

    @Override
    public void keyPressed(KeyEvent e) {
        int code = e.getKeyCode();
        if(code == KeyEvent.VK_D){
            vinni.startWalking(WALKING_SPEED);
        }else if(code == KeyEvent.VK_A){
            vinni.startWalking(-WALKING_SPEED);
        }else if(code == KeyEvent.VK_SPACE){
            vinni.jump(10);
        }else if(code == KeyEvent.VK_Q){
            vinni.getBackpack().toggle();
        }else if(code == KeyEvent.VK_W){
            vinni.getBackpack().getCurrentItem().operate();
        }

    }

    @Override
    public void keyReleased(KeyEvent e) {
        int code = e.getKeyCode();
        if(code == KeyEvent.VK_D) {
            vinni.stopWalking();
            vinni.removeAllImages();
            vinni.addImage(new BodyImage("data/Vinni/front2.png", 4f));
        }else if(code == KeyEvent.VK_A){
            vinni.stopWalking();
            vinni.removeAllImages();
            vinni.addImage(new BodyImage("data/Vinni/front.png", 4f));
        }
    }

    @Override
    public void keyTyped(KeyEvent e) {

    }
}
