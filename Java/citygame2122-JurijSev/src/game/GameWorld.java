package game;

import city.cs.engine.BoxShape;
import city.cs.engine.*;
import city.cs.engine.StaticBody;
import org.jbox2d.common.Vec2;

//import java.util.Scanner;



public class GameWorld extends World {
    public GameWorld() {
        super();
        //Scanner sc = new Scanner(System.in);

        // make the ground
        Shape shape = new BoxShape(11, 0.5f);
        StaticBody ground = new StaticBody(this, shape);
        ground.setPosition(new Vec2(0f, -9.5f));

        // make the character
        Vinni vinni = new Vinni(this);
        vinni.setPosition(new Vec2(7, -7));
        vinni.setCredits(15);



        //**move** here the rest of the code from Gave.java that
        //populates the World - add platforms, Student, etc.
        //(don't add anything related to the view)
    }
}
