public class CountriesInfo {
    private String name;
    private Integer population;
    private int area;
    private String language;

    public CountriesInfo(String name, Integer pop, int area, String lang){
        this.name = name;
        this.population = pop;
        this.area = area;
        this.language = lang;
    }

    public int getArea(){
        return area;
    }
    public Integer getPopulation(){
        return population;
    }
    public String getName(){
        return name;
    }
    public String getLanguage(){
        return language;
    }
}
