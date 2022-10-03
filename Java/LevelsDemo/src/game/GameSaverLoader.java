package game;

import city.cs.engine.DynamicBody;
import org.jbox2d.common.Vec2;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class GameSaverLoader {

    public static void save(String fileName, GameLevel level) throws IOException {

        boolean append = false;
        FileWriter writer = null;
        try {
            writer = new FileWriter(fileName, append);

            writer.write(level.getName() + "\n");

            for(int i=0; i<level.getDynamicBodies().size(); i++){
                DynamicBody b = level.getDynamicBodies().get(i);

                if(b instanceof Books){
                    writer.write("Books," + b.getPosition().x + "," + b.getPosition().y +"\n");
                }else if(b instanceof Student){
                    writer.write("Student," + b.getPosition().x + "," + b.getPosition().y + "," + ((Student) b).getBookCount() +"\n");
                }else if(b instanceof Professor){
                    writer.write("Professor," + b.getPosition().x + "," + b.getPosition().y +"\n");
                }
            }

        } finally {
            if (writer != null) {
                writer.close();
            }
        }
    }

    public static GameLevel load(String fileName, Game game) throws IOException{
        FileReader fr = null;
        BufferedReader reader = null;


        try {

            fr = new FileReader(fileName);
            reader = new BufferedReader(fr);

            String line = reader.readLine();
            GameLevel level = null;
            if(line.equals("Level1")){
                level = new Level1(game);
            }else if(line.equals("Level2")){
                level = new Level2(game);
            }

            line = reader.readLine();

            while (line != null) {

                String[] tokens = line.split(",");

                if(tokens[0].equals("Books")){
                    Books books = new Books(level);
                    books.setPosition(new Vec2(Float.parseFloat(tokens[1]),Float.parseFloat(tokens[2])));
                }
                if(tokens[0].equals("Professor")){
                    Professor professor = new Professor(level);
                    professor.setPosition(new Vec2(Float.parseFloat(tokens[1]),Float.parseFloat(tokens[2])));
                }
                if(tokens[0].equals("Student")){
                    Student student = new Student(level);
                    student.setPosition(new Vec2(Float.parseFloat(tokens[1]),Float.parseFloat(tokens[2])));
                    //student.setBookCount(Integer.parseInt(tokens[3]));
                }
                line = reader.readLine();
            }
            return level;
        } finally {
            if (reader != null) {
                reader.close();
            }
            if (fr != null) {
                fr.close();
            }
        }
    }
}
