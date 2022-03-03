package game;

import city.cs.engine.*;
import org.jbox2d.common.Vec2;

import javax.swing.JFrame;

/**
 * Your main game entry point
 */
public class Game {


    /** Initialise a new Game. */
    public Game() {

        //1. make an empty game world
        GameWorld world = new GameWorld();


        //code that creates bodies was moved
        //in the GameWorld constructor


        //3. make a view to look into the game world
        GameView view = new GameView(world,1000,500);
        view.addMouseListener(new GiveFocus(world,view));

        MouseHandler mouseHandler = new MouseHandler(world,view);

        view.addMouseListener(mouseHandler);

        VinniController controller = new VinniController(world.getVinni(),view);

        view.addKeyListener(controller);

        ViewListener viewController = new ViewListener(world.getVinni(),view);

        world.addStepListener(viewController);

        //view.setCentre(new Vec2(world.getVinni().getPosition().x, world.getVinni().getPosition().y));




        //optional: draw a 1-metre grid over the view
        view.setGridResolution(1);


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
         JFrame debugView = new DebugViewer(world, 500, 500);

        // start our game world simulation!
        world.start();
    }

    /** Run the game. */
    public static void main(String[] args) {

        new Game();
    }
}
