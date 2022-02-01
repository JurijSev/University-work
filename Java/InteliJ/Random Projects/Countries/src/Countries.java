import java.util.HashMap;

public class Countries {
    public static void main(String[] args) {

        HashMap<String, CountriesInfo> Country = new HashMap<String, CountriesInfo>();

        CountriesInfo Russia = new CountriesInfo("Russia", 146000000, 17098242, "Russian");
        CountriesInfo Britain = new CountriesInfo("Britain", 67000000, 242495, "English");
        CountriesInfo China = new CountriesInfo("China", 1447000000, 9596961, "Mandarin");
        CountriesInfo Canada = new CountriesInfo("Canada", 38000000, 9984670, "English");
        CountriesInfo UnitedStates = new CountriesInfo("USA", 334000000, 9826675, "English");
        CountriesInfo Brazil = new CountriesInfo("Brazil", 215000000, 9826675, "Portuguese");
        CountriesInfo Australia = new CountriesInfo("Australia", 25700000, 7741220, "English");

        Country.put("Russia", Russia);
        Country.put("Britain", Britain);
        Country.put("China", China);
        Country.put("Canada", Canada);
        Country.put("USA", UnitedStates);
        Country.put("Brazil", Brazil);
        Country.put("Australia", Australia);

        System.out.println(Country.keySet());

        //System.out.println(compare("Russia","Britain"));


    }

//    public static String compare(String a, String b){
//        int c = Country.get(a).getPopulation();
//        int d = Country.get(b).getPopulation();
//        if(c>d){
//            return(Country.get(a).getName());
//        }else if(c=d){
//            return(Country.get(b).getName());
//        }else{return 0;}
//    }

}
