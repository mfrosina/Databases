import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Scanner;

public class DB2Test {

    private Connection connection;
    private Statement statement;
    private ResultSet resultSet;


    public void openConnection(){

// Step 1: Load IBM DB2 JDBC driver

        try {

            DriverManager.registerDriver(new com.ibm.db2.jcc.DB2Driver());

        }

        catch(Exception cnfex) {

            System.out.println("Problem in loading or registering IBM DB2 JDBC driver");

            cnfex.printStackTrace();
        }

// Step 2: Opening database connection


        try {

            connection = DriverManager.getConnection("jdbc:db2://62.44.108.24:50000/SAMPLE", "db2admin", "db2admin");

            statement = connection.createStatement();

        }

        catch(SQLException s){

            s.printStackTrace();

        }

    }

    public void closeConnection(){

        try {

            if(null != connection) {

                // cleanup resources, once after processing

                resultSet.close();

                statement.close();


                // and then finally close connection

                connection.close();

            }

        }

        catch (SQLException s) {

            s.printStackTrace();

        }

    }

    public void select(String stmnt, int column) {

        try{

            resultSet = statement.executeQuery(stmnt);

            String result = "";

            while(resultSet.next()) {

                for (int i = 1; i <= column; i++) {

                    result += resultSet.getString(i);

                    if (i == column) result += " \n";
                    else             result += ", ";
                }
            }

            System.out.println("Executing query: " + stmnt + "\n");
            System.out.println("Result output \n");
            System.out.println("---------------------------------- \n");
            System.out.println(result);

        }
        catch (SQLException s)
        {
            s.printStackTrace();
        }

    }

    public void insert(String stmnt) {

        try{

            statement.executeUpdate(stmnt);

        }

        catch (SQLException s){

            s.printStackTrace();

        }

        System.out.println("Successfully inserted!");

    }


    public void delete(String stmnt) {

        try{

            statement.executeUpdate(stmnt);

        }

        catch (SQLException s){

            s.printStackTrace();

        }

        System.out.println("Successfully deleted!");

    }

    public static void main(String[] args) {

        DB2Test db2Obj = new DB2Test();
        String stmnt = "";

        db2Obj.openConnection();

        Scanner scanner = new Scanner(System.in);
        int input = 0;
        while(input != -1)
        {
            System.out.printf("%s:\n%s\n%s\n%s\n", "Please, enter", "0 to select data","1 to insert data","2 to delete data","from SERIES table.");
            System.out.printf("%s\n","Enter -1 to exit the program.");
            input = scanner.nextInt();
            if(input == 0)
            {
                stmnt = "SELECT SERIE_ID,SERIE_NAME,START_DATE,NUMBER_OF_SEASONS,GENRE FROM FN1MI8000006.SERIES";
                db2Obj.select(stmnt, 5);
            }
            else if(input == 1)
            {
                System.out.println("Enter serie id, serie name, start date, number of seasons and genre for the serie:");
                String id = "";
                String title = "";
                String date = "";
                int seasons = 0;
                String genre = "";
                id = scanner.next();
                title = scanner.next();
                date = scanner.next();
                seasons = scanner.nextInt();
                genre = scanner.next();
                if(id != "" && title != "" && date != "" && genre != "")
                {
                    stmnt = " INSERT INTO FN1MI8000006.SERIES(SERIE_ID, SERIE_NAME,START_DATE,NUMBER_OF_SEASONS,GENRE)"
                            + " VALUES ('" + id + "','" + title + "','" + date + "','" + seasons + "','" + genre + "')";

                    db2Obj.insert(stmnt);
                }
                else if(genre == "")
                {
                    stmnt = " INSERT INTO FN1MI8000006.SERIES(SERIE_ID, SERIE_NAME,START_DATE,NUMBER_OF_SEASONS)"
                            + " VALUES ('" + id + "','" + title + "','" + date + "','" + seasons + "')";

                    db2Obj.insert(stmnt);
                }
                else
                {
                    System.out.println("Invalid data for the serie entered! Please, try again...");
                    System.out.println(id + title + date + seasons + genre);
                }
            }
            else if(input == 2)
            {
                System.out.println("Please, enter valid id for the serie you want to delete:");
                String id;
                id = scanner.next();
                stmnt = "DELETE FROM FN1MI8000006.SERIES WHERE SERIE_ID = " + "'" + id + "' ";
                db2Obj.delete(stmnt);
            }
            else if(input == -1)
            {
                System.out.println("Exiting program...");
                db2Obj.closeConnection();
            }
            else {
                System.out.println("Invalid input! Please, try again...");
            }
        }

    }

}
