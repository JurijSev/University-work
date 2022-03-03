package game;

import city.cs.engine.StepEvent;
import city.cs.engine.StepListener;
import org.jbox2d.common.Vec2;

class ViewListener implements StepListener {

    private Vinni vinni;
    private GameView view;

    public ViewListener(Vinni v, GameView view){
        this.vinni = v;
        this.view = view;
    }

    @Override
    public void preStep(StepEvent stepEvent) {
        view.setCentre(new Vec2(vinni.getPosition()));
    }

    @Override
    public void postStep(StepEvent stepEvent) {
    }
}
