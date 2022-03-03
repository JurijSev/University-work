package game;

import city.cs.engine.BoxShape;
import city.cs.engine.*;
import city.cs.engine.StaticBody;
import org.jbox2d.common.Vec2;

import javax.swing.*;


public class GameWorld extends World {
    //new Vinni field
    private Vinni vinni;

    public GameWorld() {
        super();

        // make the ground
        Shape grnd = new BoxShape(10f, 0.5f);
        Shape grnd2 = new BoxShape(20f,0.5f);
        StaticBody ground1 = new StaticBody(this, grnd);
        ground1.setPosition(new Vec2(-15f, -9.5f));
        StaticBody ground2 = new StaticBody(this, grnd2);
        ground2.setPosition(new Vec2(20f,-9.5f));
        StaticBody ground3 = new StaticBody(this, grnd2);
        ground3.setPosition(new Vec2(73f,7.5f));
        StaticBody ground4 = new StaticBody(this,grnd2);
        ground4.setPosition(new Vec2(113f,7.5f));
        StaticBody ground5 = new StaticBody(this, grnd2);
        ground5.setPosition(new Vec2(113f, 20f));

        //make hole
        Shape wall = new BoxShape(0.5f,5f);
        StaticBody holeWall1 = new StaticBody(this, wall);
        holeWall1.setPosition(new Vec2(-5,-14.5f));
        StaticBody holeWall2 = new StaticBody(this, wall);
        holeWall2.setPosition(new Vec2(0,-14.5f));
        Shape holeGrnd = new BoxShape(2.5f,0.5f);
        StaticBody holeGround = new StaticBody(this, holeGrnd);
        holeGround.setPosition(new Vec2(-2.5f,-19.5f));

        //make hill
        Shape hillShape = new BoxShape(7.5f,0.5f);
        Shape shortHillShape = new BoxShape(4f,0.5f);
        StaticBody hill = new StaticBody(this, hillShape);
        hill.setPosition(new Vec2(46.25f,-4.83f));
        hill.setAngleDegrees(37.5f);
        StaticBody hill2 = new StaticBody(this, shortHillShape);
        hill2.setPosition(new Vec2(53f,3f));
        hill2.setAngleDegrees(87);

        //make platforms
        Shape veryShortPlatform = new BoxShape(0.5f,0.5f);
        Shape shortPlatform = new BoxShape(2f,0.5f);
        Shape medPlatform = new BoxShape(3f,0.5f);
        Shape longPlatform = new BoxShape(5f,0.5f);
        StaticBody med1 = new StaticBody(this, medPlatform);
        med1.setPosition(new Vec2(-10f,-4.5f));
        StaticBody med2 = new StaticBody(this, medPlatform);
        med2.setPosition(new Vec2(-5f,0f));
        StaticBody short1 = new StaticBody(this, shortPlatform);
        short1.setPosition(new Vec2(-13f,4.5f));
        StaticBody veryShort1 = new StaticBody(this,veryShortPlatform);
        veryShort1.setPosition(new Vec2(-20f,10f));
        StaticBody long1 = new StaticBody(this,longPlatform);
        long1.setPosition(new Vec2(4f,5f));
        StaticBody veryShort2 = new StaticBody(this, veryShortPlatform);
        veryShort2.setPosition(new Vec2(-1f,-17f));
        StaticBody veryShort3 = new StaticBody(this, veryShortPlatform);
        veryShort3.setPosition(new Vec2(-4f,-12f));
        StaticBody med3 = new StaticBody(this, medPlatform);
        med3.setPosition(new Vec2(17.5f,-4.5f));
        StaticBody short2 = new StaticBody(this, shortPlatform);
        short2.setPosition(new Vec2(35f,-4.5f));
        StaticBody short3 = new StaticBody(this, shortPlatform);
        short3.setPosition(new Vec2(30f,-1f));
        StaticBody short4 = new StaticBody(this,shortPlatform);
        short4.setPosition(new Vec2(25f,4.5f));
        StaticBody veryShort4 = new StaticBody(this, veryShortPlatform);
        veryShort4.setPosition(new Vec2(37f,7.5f));
        StaticBody veryShort5 = new StaticBody(this, veryShortPlatform);
        veryShort5.setPosition(new Vec2(44f,8f));
        StaticBody veryShort6 = new StaticBody(this, veryShortPlatform);
        veryShort6.setPosition(new Vec2(20f,10f));
        StaticBody long2 = new StaticBody(this,longPlatform);
        long2.setPosition(new Vec2(70f,13f));
        StaticBody short5 = new StaticBody(this,shortPlatform);
        short5.setPosition(new Vec2(82f,15f));
        StaticBody veryShort7 = new StaticBody(this,veryShortPlatform);
        veryShort7.setPosition(new Vec2(89f,17.5f));

        //make wall
        Shape shortWall = new BoxShape(0.5f,2.5f);
        StaticBody shortWall1 = new StaticBody(this, shortWall);
        shortWall1.setPosition(new Vec2(74f,10.5f));
        StaticBody shortWall2 = new StaticBody(this, shortWall);
        shortWall2.setPosition(new Vec2(80f,17.5f));



        // make the character
        vinni = new Vinni(this);
        vinni.setPosition(new Vec2(7, -7));
        vinni.setCredits(15);


        vinni.getBackpack().addItem(new Pistol(vinni));
        vinni.getBackpack().addItem(new Jetpack(vinni));
        //**move** here the rest of the code from Gave.java that
        //populates the World - add platforms, Student, etc.
        //(don't add anything related to the view)
    }

    public Vinni getVinni(){
        return vinni;
    }
}
