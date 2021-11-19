public class Film {
    String title;
    int releaseYear;
    double duration;
    int soldTickets;

    Film(String newTitle, int newReleaseYear, double newDuration, int newSoldTickets){
        title = newTitle;
        releaseYear = newReleaseYear;
        duration = newDuration;
        soldTickets = newSoldTickets;
    }

    void increment(){
        soldTickets++;
    }

    void updateDuration(double newDuration){
        duration = newDuration;
    }

    //void
}
