import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
public class HashMapExample {
    public static void main(String[] args) {

        Map<String, String> m1 = new HashMap<String, String>();
            m1.put("January","Winter");
            m1.put("July","Summer");

        Map<String, String> m2 = new HashMap<String,String>();
            m2.put("January","Still Winter");
            m2.put("August","Summer");

        m1.putAll(m2);

        for(String s: m1.values()){
            System.out.print(s+" ");
        }

        System.out.println();

        for(Map.Entry<String, String> e: m1.entrySet()){
            System.out.print(e.getKey() + ":" + e.getValue() + " ");
        }

        System.out.println();
        System.out.println(m1.keySet());
        System.out.println(m1.values());
        System.out.println(m1.get("January"));
    }
}
