package game;

import city.cs.engine.*;
import city.cs.engine.Shape;
import org.jbox2d.common.Vec2;

import javax.swing.JFrame;

import java.awt.*;
import java.io.IOException;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;

/**
 * Your main game entry point
 */
public class Game {


    /** Initialise a new Game. */
    public Game() {

        //1. make an empty game world
        World world = new World();

        //2. populate it with bodies (ex: platforms, collectibles, characters)

        //make the ground
        Shape shape = new BoxShape(11, 0.5f);
        StaticBody ground = new StaticBody(world, shape);
        ground.setPosition(new Vec2(0f, -11.5f));

        // make a platform
        Shape platformShape = new BoxShape(3.5f, 0.5f);
        StaticBody platform1 = new StaticBody(world, platformShape);
        platform1.setPosition(new Vec2(-8, 5.5f));

        //make a new platform
        StaticBody platform2 = new StaticBody(world, platformShape);
        platform2.setPosition(new Vec2(8, 5.5f));
        platform2.setAngleDegrees(225);

        //Build walls outside platform
        Shape wallShape= new BoxShape(0.5f,3);
        StaticBody wall1 = new StaticBody(world, wallShape);
        wall1.setPosition(new Vec2(-10.5f,-8));
        StaticBody wall2 = new StaticBody(world, wallShape);
        wall2.setPosition(new Vec2(10.5f,-8));



        //make a ball
        Shape ballShape = new CircleShape(1.5f,8,7f);
        DynamicBody ball = new DynamicBody(world, ballShape);


        //make a character (with an overlaid image)
        Shape studentShape = new BoxShape(1,2);
        DynamicBody student = new DynamicBody(world, studentShape);
        student.setPosition(new Vec2(7,-5));
        student.addImage(new BodyImage("data/student.png", 4));
        student.setAlwaysOutline(true);
        student.setLinearVelocity(new Vec2(0,10.2f));
        student.setAngularVelocity(2.5f);

        //3. make a view to look into the game world
        UserView view = new UserView(world, 800, 600);
        //view.setCentre(new Vec2(10,0));

        Shape towerShape = new BoxShape(0.5f,0.25f);
        //Body towerBody = new DynamicBody(world, towerShape);
        //towerBody.setPosition(new Vec2(0,0));

        for(int i=0;i<50;i++){
            Body towerBody = new DynamicBody(world, towerShape);
            towerBody.setFillColor(new Color(200+i,200+i,150+i));
            towerBody.setPosition(new Vec2(0+0.1f*i,-5+i));
        }

        //optional: draw a 1-metre grid over the view
        //view.setGridResolution(1);


        //4. create a Java window (frame) and add the game
        //   view to it
        final JFrame frame = new JFrame("City Game");
        frame.add(view);

        // enable the frame to quit the application
        // when the x button is pressed
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLocationByPlatform(true);
        // don't let the frame be resized
        frame.setResizable(false);
        // size the frame to fit the world view
        frame.pack();
        // finally, make the frame visible
        frame.setVisible(true);

        //optional: uncomment this to make a debugging view
       //  JFrame debugView = new DebugViewer(world, 500, 500);

        // start our game world simulation!
        world.start();
    }

    /** Run the game. */
    public static void main(String[] args) {

        new Game();
    }
}




