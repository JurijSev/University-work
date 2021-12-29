public class Test {     //Create Test class - Question 2
    public static void main(String[] args) {        //Create main method

        Student Jurij = new Student("Jurij", 210012987);    //Create object Jurij - Question 2
        System.out.println("Jurij pass Java: "+Jurij.isPassJava());           //Testing Student class - Question 2

        Student Jesse = new Student("Jesse", 44444);        //Create objects Jesse - Question 3/4
        Student Ali = new Student("Ali", 55555);            //Create objects Ali - Question 3/4

        Team team1 = new Team(Jurij, Jesse, Ali); //Create object team1
        System.out.println("Team 1: "+team1.getMember1().getName() +", "+team1.getMember2().getName()+" and "+team1.getMember3().getName());    //Testing Team class

        System.out.println("One pass for team one: "+onePass(team1));   //Testing onePass method - Question 4
        Jurij.setPassJava(true);                                        //Use passJava setter to set it to true
        System.out.println("One pass for team one (after Jurij passJava): "+onePass(team1));    //Print out result

        System.out.println("Number of teams (After team1 created): "+team1.getNumberOfTeams());     //Testing numberOfTeams variable - Question 5
        Student Bob = new Student("Bob", 11111);        //Create a new student
        Student Julie = new Student("Julie", 22222);    //Create a new student
        Student Lily = new Student("Lily", 33333);      //Create a new student
        Team team2 = new Team(Bob, Julie, Lily);        //Create new team with new students for testing purposes
        System.out.println("Number of teams (After team2 created): "+team2.getNumberOfTeams());     //Test for new numberOfTeams
        Team team3 = new Team(Jesse,Jurij,Ali);         //Create new team with students already initialised for testing purposes
        System.out.println("Number of teams (After team3 created): "+team3.getNumberOfTeams());     //Test for new numberOfTeams
        Team team4 = new Team(Ali,Jurij,Bob);           //Create new team with students already initialised for testing purposes
        System.out.println("Number of teams (After team4 created): "+team4.getNumberOfTeams());     //Test for new numberOfTeams
    }

    public static boolean onePass(Team team){       //Check if at least one of the students in the team has true for passJava - Question 4
        return team.getMember1().isPassJava() || team.getMember2().isPassJava() || team.getMember3().isPassJava();      //Compare all member passJava states and return
    }
}
