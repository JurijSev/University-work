package game;

import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

public class VinniController implements KeyListener {

    //private static final float WALKING_SPEED = 5;
    Vinni vinni;

    public VinniController(Vinni v) {
        this.vinni = v;
    }

    @Override
    public void keyPressed(KeyEvent e) {
        int code = e.getKeyCode();
        if(code == KeyEvent.VK_D){
            vinni.startWalking(5);
        }else if(code == KeyEvent.VK_A){
            vinni.startWalking(-5);
        }
    }

    @Override
    public void keyReleased(KeyEvent e) {
        int code = e.getKeyCode();
        if(code == KeyEvent.VK_D) {
            vinni.stopWalking();
        }else if(code == KeyEvent.VK_A){
            vinni.stopWalking();
        }
    }

    @Override
    public void keyTyped(KeyEvent e) {
        System.out.println("a key is pressed");
    }
}
