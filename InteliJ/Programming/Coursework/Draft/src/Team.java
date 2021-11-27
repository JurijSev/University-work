//Create Team Class - Question 3
public class Team {
    private static int numberOfTeams = 0;
    private Student member1;
    private Student member2;
    private Student member3;

    public int getNumberOfTeams() {
        return numberOfTeams;
    }

    public Student getMember1() {
        return member1;
    }

    public void setMember1(Student member1) {
        this.member1 = member1;
    }

    public Student getMember2() {
        return member2;
    }

    public void setMember2(Student member2) {
        this.member2 = member2;
    }

    public Student getMember3() {
        return member3;
    }

    public void setMember3(Student member3) {
        this.member3 = member3;
    }

    public Team(Student member1, Student member2, Student member3) {
        this.member1 = member1;
        this.member2 = member2;
        this.member3 = member3;
        //number of teams doesn't require to be this.numberOfTeams
        ++numberOfTeams;
    }
}
