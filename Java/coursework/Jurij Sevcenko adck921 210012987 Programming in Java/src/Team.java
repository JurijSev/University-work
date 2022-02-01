public class Team {         //Create Team Class - Question 3
    private static int numberOfTeams = 0;   //Initialise numberOfTeams int variable
    private Student member1;                //Initialise member1 Student variable
    private Student member2;                //Initialise member2 Student variable
    private Student member3;                //Initialise member3 Student variable

    public int getNumberOfTeams() {
        return numberOfTeams;
    }       //Initialise getter for numberOfTeams

    public Student getMember1() {
        return member1;
    }       //Initialise getter for member1

    public void setMember1(Student member1) {
        this.member1 = member1;
    }       //Initialise setter for member1

    public Student getMember2() {
        return member2;
    }       //Initialise getter for member2

    public void setMember2(Student member2) {
        this.member2 = member2;
    }       //Initialise setter for member2

    public Student getMember3() {
        return member3;
    }       //Initialise getter for member3

    public void setMember3(Student member3) {
        this.member3 = member3;
    }       //Initialise setter for member3

    public Team(Student member1, Student member2, Student member3) {        //Initialise constructor for class Team
        this.member1 = member1;         //Set member1 as provided member1
        this.member2 = member2;         //Set member1 as provided member2
        this.member3 = member3;         //Set member1 as provided member3
        ++numberOfTeams;                /*Increment numberOfTeams
                                         *number of teams doesn't require to be
                                         *this.numberOfTeams even though it is private
                                         */
    }
}
