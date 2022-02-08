import java.sql.Array;
import java.util.Arrays;
public class Shop {
    private String name;
    private int numberOfArticles;
    private int[] articles;

    public String getName() {
        return name;
    }

    public int getNumberOfArticles() {
        return numberOfArticles;
    }

    public int[] getArticles() {
        return articles;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setNumberOfArticles(int numberOfArticles) {
        if (numberOfArticles >= 0) {
            this.numberOfArticles = numberOfArticles;
        }
    }

    public void getArticle(int i) {
        if (this.articles[i] >= 0) {
            System.out.println(this.articles[i]);
        }
    }
    {
        System.out.println("Welcome to the new shop");
    }

    public void setArticles(int[] articles) {
        this.articles = articles;
    }

    public Shop(){
        this.name = "shop open soon";
        this.numberOfArticles = 0;
        this.articles = new int[1];
    }

    public Shop(String name, int numberOfArticles, int[] articles) {
        this.name = name;
        this.numberOfArticles = numberOfArticles;
        this.articles = articles;
    }
}
