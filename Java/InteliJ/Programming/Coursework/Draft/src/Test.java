//Create Test class - Question 2
public class Test {
    public static void main(String[] args) {
        //create object Jurij - Question 2

        Student Jurij = new Student("Jurij", 210012987);

        //testing Student class - Question 2

        System.out.println("Jurij pass Java: "+Jurij.isPassJava());

        //create objects Jesse and Ali - Question 3/4

        Student Jesse = new Student("Jesse", 44444);
        Student Ali = new Student("Ali", 55555);
        //create object team1
        Team team1 = new Team(Jurij, Jesse, Ali);
        //testing Team class
        System.out.println("Team 1: "+team1.getMember1().getName() +" and "+team1.getMember2().getName()+" and "+team1.getMember3().getName());

        //testing onePass method - Question 4

        System.out.println("One pass for team one: "+onePass(team1));
        Jurij.setPassJava(true);
        System.out.println("One pass for team one (after Jurij passJava): "+onePass(team1));

        //testing numberOfTeams variable - Question 5

        System.out.println("Number of teams (After team1 created): "+team1.getNumberOfTeams());
        Student Bob = new Student("Bob", 11111);
        Student Julie = new Student("Julie", 22222);
        Student Lily = new Student("Lily", 33333);
        //Create new team for testing purposes
        Team team2 = new Team(Bob, Julie, Lily);
        //test for new numberOfTeams
        System.out.println("Number of teams (After team2 created): "+team2.getNumberOfTeams());
        Team team3 = new Team(Jesse,Jurij,Ali);
        //test for new numberOfTeams
        System.out.println("Number of teams (After team3 created): "+team3.getNumberOfTeams());
        Team team4 = new Team(Ali,Jurij,Jesse);
        //test for new numberOfTeams
        System.out.println("Number of teams (After team4 created): "+team4.getNumberOfTeams());

    }
    //Checking if at least one of the students in the team has true for passJava - Question 4
    public static boolean onePass(Team team){
        return team.getMember1().isPassJava() || team.getMember2().isPassJava() || team.getMember3().isPassJava();
    }
}
