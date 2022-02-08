public class Student {
    String name;
    int IDnumber;
    int[] marks;

    void updateMarks(int i, int newMark){
        marks[i] = newMark;
    }

    int returnMarks(){
        int count = 0;
        for(int i= 0; i<marks.length; i++){
            if(marks[i]<40){
                count++;
            };
        }
        return count;
    }

    public Student(String name, int IDnumber) {
        this.name = name;
        this.IDnumber = IDnumber;
        this.marks = new int[]{0,0,0,0,0,0,0,0,0,0};
        //this.marks= marks;
    }

}
