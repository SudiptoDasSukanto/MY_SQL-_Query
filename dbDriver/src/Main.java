import java.sql.Date;
import java.sql.SQLException;

public class Main{
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        String url = "jdbc:mysql://localhost:3306/lab";
        String username = "root";
        String password = "*#0*#S.D.S?";
        DBdriver db = new DBdriver(url,username,password);

        db.connect();
        //db.insert(29,"ENG", Date.valueOf("2023-09-04"),20,50,70);
        db.select();
        db.close();

    }
}