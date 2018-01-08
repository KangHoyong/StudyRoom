import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class docker_DB_test {

    public static void main(String[] args)
    {
        try{
            Connection con = null;

            //String url = "jdbc:mysql://127.0.0.1:4444:3306";
            //String user = "root";
            //String password = "password";

            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:4444", "root" , "password");

            java.sql.Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            rs = st.executeQuery("SHOW DATABASES");

            if(st.execute("SHOW DATABASES"))
            {
                rs = st.getResultSet();
            }
            while (rs.next())
            {
                String str = rs.getNString(1);
                System.out.println(str);
            }

        }
        catch (SQLException sqex)
        {
            System.out.println("SQLException" + sqex.getMessage());
            System.out.println("SQLState : " + sqex.getSQLState());
        }




    }
}


