import java.util.ArrayList;
import java.util.HashMap;

public class Test {
    public static void main(String[] args) {
        ChristmasGift a = new ChristmasGift("Computer", "Ethan", 700);
        ChristmasGift b = new ChristmasGift("Xbox", "Joel", 500);
        ChristmasGift c = new ChristmasGift("Car", "Lily", 1000);

        MyChristmasList list1 = new MyChristmasList();
        list1.addGift(a);
        list1.addGift(b);
        list1.addGift(c);

        printRecipient(list1);
        System.out.println(printMostExpensive(list1).getName());

        MapToPrice m = new MapToPrice();
        m.addToMap(a);
        m.addToMap(b);
        m.addToMap(c);

        System.out.println(isInValues(m,15));
        System.out.println(isInValues(m,13));

        m.namesOfObjects(500);
        System.out.println();
        m.namesOfObjects(8);
        System.out.println();
        m.namesOfObjects(14);

    }
    public static void printRecipient(MyChristmasList list){
        System.out.println("List of recipients: ");
        for(int i = 0; i<list.getMyList().size();i++){
            System.out.println(list.getMyList().get(i).getRecipient());
        }
    }
    public static ChristmasGift printMostExpensive(MyChristmasList list){
        System.out.println("The most expensive item: ");
        int itemCost = 0;
        ChristmasGift most = null;
        for(int i = 0; i<list.getMyList().size();i++){
            if(list.getMyList().get(i).getPrice() > itemCost){
                itemCost = list.getMyList().get(i).getPrice();
                most = list.getMyList().get(i);
            }
        }
        return most;
    }

    public static Boolean isInValues(MapToPrice m, int i){
        return m.getMyMap().containsValue(i);
    }
}
