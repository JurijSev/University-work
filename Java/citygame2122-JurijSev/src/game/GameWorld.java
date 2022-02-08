package game;

import city.cs.engine.BoxShape;
import city.cs.engine.*;
import city.cs.engine.StaticBody;
import org.jbox2d.common.Vec2;



public class GameWorld extends World {
    public GameWorld() {
        super();

        // make the ground
        Shape shape = new BoxShape(11, 0.5f);
        StaticBody ground = new StaticBody(this, shape);
        ground.setPosition(new Vec2(0f, -11.5f));

        // make the character
        Student student = new Student(this);
        student.setPosition(new Vec2(7, -9));
        student.setCredits(15);


        //**move** here the rest of the code from Gave.java that
        //populates the World - add platforms, Student, etc.
        //(don't add anything related to the view)
    }
}
