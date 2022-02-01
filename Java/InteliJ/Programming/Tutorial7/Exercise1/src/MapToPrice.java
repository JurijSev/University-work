import java.util.HashMap;

public class MapToPrice {
    private HashMap<ChristmasGift, Integer> myMap;

    public MapToPrice(){
        myMap = new HashMap<ChristmasGift, Integer>();
    }

    public HashMap<ChristmasGift, Integer> getMyMap(){
        return myMap;
    }

    public void setMyMap(HashMap<ChristmasGift, Integer> myMap){
        this.myMap = myMap;
    }

    public void addToMap(ChristmasGift g){
        myMap.put(g,g.getPrice());
    }

    public void namesOfObjects(int i){
        for(HashMap.Entry<ChristmasGift, Integer> e: myMap.entrySet()){
            if(e.getValue()>=i){
                System.out.println(e.getKey().getName() + " ");
            }
        }
    }


}
