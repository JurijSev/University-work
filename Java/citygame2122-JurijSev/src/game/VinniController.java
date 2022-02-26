package game;

import city.cs.engine.BodyImage;
import city.cs.engine.Walker;

import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

public class VinniController implements KeyListener {

    private static final float WALKING_SPEED = 5;
    private Vinni vinni;

    public VinniController(Vinni v) {
        this.vinni = v;
    }

    @Override
    public void keyPressed(KeyEvent e) {
        int code = e.getKeyCode();
        if(code == KeyEvent.VK_D){
            vinni.removeAllImages();
            vinni.addImage(new BodyImage("data/Vinni/VinniRightWalk.gif", 4f));
            vinni.startWalking(WALKING_SPEED);
        }else if(code == KeyEvent.VK_A){
            vinni.removeAllImages();
            vinni.addImage(new BodyImage("data/Vinni/VinniLeftWalk.gif", 4f));
            vinni.startWalking(-WALKING_SPEED);
        }else if(code == KeyEvent.VK_SPACE){
            vinni.jump(10);
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
