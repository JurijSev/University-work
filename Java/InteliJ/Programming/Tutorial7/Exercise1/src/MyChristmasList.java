import java.util.ArrayList;

public class MyChristmasList {
    private ArrayList<ChristmasGift> myList;

    public ArrayList<ChristmasGift> getMyList() {
        return myList;
    }

    public void setMyList(ArrayList<ChristmasGift> myList) {
        this.myList = myList;
    }

    public MyChristmasList() {
        this.myList = new ArrayList<>(0);
    }

    public void addGift(ChristmasGift newGift){
        myList.add(newGift);
    }

}
