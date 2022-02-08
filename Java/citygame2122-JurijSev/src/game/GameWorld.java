package game;

import city.cs.engine.BoxShape;
import city.cs.engine.Shape;
import city.cs.engine.StaticBody;

public class GameWorld extends World{
    public GameWorld(){
        super();

        //make a ground platform
        Shape shape = new BoxShape(30, 0.5f);
        StaticBody ground = new StaticBody(this, shape);
        ground.setPosition(new Vec2(0f, -11.5f));

        // make a suspended platform
        Shape platformShape = new BoxShape(3, 0.5f);
        StaticBody platform1 = new StaticBody(this, platformShape);
        platform1.setPosition(new Vec2(-8, -4f));

        //make a character (with an overlaid image)
        Student student = new Student(this);
        Student.setPosition(new Vec2(7,-9));

        //**move** here the rest of the code from Gave.java that
        //populates the World - add platforms, Student, etc.
        //(don't add anything related to the view)
    }

}
