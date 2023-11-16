package stepdefinitions;

import com.mysql.cj.protocol.Resultset;
import io.cucumber.java.en.Given;
import utilities.DBUtils;
import utilities.Manage;

import java.sql.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class DB_Stepdefinitions {
    String  query;
    ResultSet rs;
    PreparedStatement preparedStatement;
    Manage manage=new Manage();

    @Given("Database connection is established.")
    public void database_connection_is_established() {
        DBUtils.createConnection();
    }
    @Given("Update the {string} of the usernames with the penultimate letter e in the Users table")
    public void update_the_mobile_number_of_the_usernames_with_the_penultimate_letter_e_in_the_users_table(String mobileNumber) throws SQLException {
        query= manage.getQuery17();
        preparedStatement=DBUtils.getPraperedStatement(query);
        preparedStatement.setString(1,mobileNumber);
        int rowCount= preparedStatement.executeUpdate();
    }
    @Given("Database connection is closed")
    public void database_connection_is_closed() {
        DBUtils.closeConnection();
    }
    @Given("Query is prepared and executed.")
    public void query_is_prepared_and_executed() throws SQLException {
        query= manage.getQuery01();
        rs =DBUtils.getStatement().executeQuery(query);

    }

    @Given("Results are obtained.")
        public void Results_are_obtained() throws SQLException {
        rs.next();
        Integer actual= rs.getInt("user_id");
        Integer user_idExpected=1;
        assertEquals( user_idExpected,actual);
        }
    @Given("{string} is prepared and executed.")
    public void is_prepared_and_executed(String query) throws SQLException {
       query= manage.getQuery02();
       rs=DBUtils.getStatement().executeQuery(query);
    }
    @Given("Verify the {string} information Results are obtained.")
    public void verify_the_information_results_are_obtained(String column) throws SQLException {
        rs.next();
        String rToken=rs.getString(column);
        String expToken="sH3BH9e6YvLn1543QeyAhupgJiLrTQvNFXSLmTQMid8ZuISCz7EUwwgMnozF";
        assertEquals(expToken,rToken);
    }
    @Given("cron_schedules_Query is prepared and executed.")
    public void cron_schedules_query_is_prepared_and_executed() throws SQLException {
       query= manage.getQuery03();
       rs=DBUtils.getStatement().executeQuery(query);
    }
    @Given("name Results are obtained.")
    public void name_results_are_obtained() throws SQLException {
        List<String> names = new ArrayList<>();
        while (rs.next()) {
            String name=rs.getString("name");
            names.add(name);
            List<String> expected = new ArrayList<>();
            expected.add("10 Minutes");
            expected.add("5 Minutes");

            for (int i = 0; i < names.size(); i++) {
                assertEquals(expected.get(i), names.get(i));
            }


        }
    }
    @Given("deposits_Query is prepared and executed.")
    public void deposits_query_is_prepared_and_executed() throws SQLException {
        query= manage.getQuery04();
        rs=DBUtils.getStatement().executeQuery(query);
    }
    @Given("{string} value of the data Results are obtained.")
    public void value_of_the_data_results_are_obtained(String Column) throws SQLException {
        List<Double>charges=new ArrayList<>();
        charges.add(106.00000000);
        charges.add(102.00000000);
        List<Double>actualcharge=new ArrayList<>();
        while (rs.next()){
            Double charge= rs.getDouble("charge");
            actualcharge.add(charge);
            for (int i = 0; i < actualcharge.size(); i++) {
                assertEquals(charges.get(i), actualcharge.get(i));
            }
        }

    }
    @Given("admin_password_resets_Query is prepared and executed.")
    public void admin_password_resets_query_is_prepared_and_executed() throws SQLException {
     query= manage.getQuery05();
        preparedStatement=DBUtils.getPraperedStatement(query);
        preparedStatement.setInt(1,11);
        preparedStatement.setString(2,"bcd@abc.com");
        preparedStatement.setString(3,"xyz123");
        preparedStatement.setInt(4,0);


    }
    @Given("Data Results are obtained.")
    public void data_results_are_obtained() throws SQLException {
        int rowCount= preparedStatement.executeUpdate();
        assertEquals(1, rowCount);
    }

    }



