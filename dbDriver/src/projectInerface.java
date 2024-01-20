import java.sql.Date;

public interface projectInerface {
    void connect();
    void insert(int stdId , String course , Date examDate, int incourseMark, int FinalMarks, int totalMarks);
    void close();
}
