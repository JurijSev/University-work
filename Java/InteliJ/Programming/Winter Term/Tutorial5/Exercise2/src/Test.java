public class Test {
    public static void main(String[] args) {
        Shop shop1 = new Shop();
        System.out.println(shop1.getName());
        int[] shop2Articles = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
        Shop shop2 = new Shop("hell", 20, shop2Articles);
        System.out.println(shop1.getName());
        System.out.println(shop2.getName());
        shop1.setNumberOfArticles(2);
        System.out.println(shop1.getNumberOfArticles());
        shop1.setNumberOfArticles(-1);
        System.out.println(shop1.getNumberOfArticles());
        shop2.getArticle(2);
        System.out.println("Last exercise done is 7");
    }
}
