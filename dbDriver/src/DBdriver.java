import javax.swing.*;
import java.sql.*;

public class DBdriver implements projectInerface{
    String url ;
    String username;
    String password ;
    Connection connection ;
    DBdriver(String url , String username , String password){
        this.url = url ;
        this.username = username ;
        this.password = password ;
    }

    public void connect()  {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try {
            connection = DriverManager.getConnection(url,username,password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if(connection!=null){
            System.out.println("Database connected");
        }
    }

    public void close(){
        try {
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void insert(int stdId , String course , Date examDate,int incourseMark,int FinalMarks,int totalMarks){
        String query = "INSERT INTO exam_marks VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1,stdId);
            statement.setString(2,course);
            statement.setDate(3,examDate);
            statement.setInt(4,incourseMark);
            statement.setInt(5,FinalMarks);
            statement.setInt(6, totalMarks);

            if(statement.executeUpdate()>0){
                System.out.println("1 Row inserted");
            }else System.out.println("Insertion Failed");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void select(){
        String query = "SELECT * FROM exam_marks";
        try {
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(query);
            while (result.next()){
                int id = result.getInt("StudentID");
                String course = result.getString("Course");
                Date date = result.getDate("ExamDate");
                int IncourseMark = result.getInt("IncourseMarks");
                int FinalMarks = result.getInt("FinalMarks");
                int TotalMarks = result.getInt("TotalMarks");
                System.out.println(id + "  " + course +"  " + date +"  " + IncourseMark + "  " + FinalMarks + " " +TotalMarks);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
