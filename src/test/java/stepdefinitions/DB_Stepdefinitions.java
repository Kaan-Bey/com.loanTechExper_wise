package stepdefinitions;

import com.mysql.cj.protocol.Resultset;
import io.cucumber.java.en.Given;
import utilities.DBUtils;
import utilities.Manage;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DB_Stepdefinitions {
    String  query;
    Resultset resultset;
    PreparedStatement preparedStatement;
    Manage manage=new Manage();

    @Given("Database connection is established.")
    public void database_connection_is_established() {
        DBUtils.createConnection();
    }
    @Given("Update the {string} of the usernames with the penultimate letter e in the Users table")
    public void update_the_mobile_number_of_the_usernames_with_the_penultimate_letter_e_in_the_users_table(String mobileNumber) throws SQLException {
        query= manage.getQuery18();
        preparedStatement=DBUtils.getPraperedStatement(query);
        preparedStatement.setString(1,mobileNumber);
        int rowCount= preparedStatement.executeUpdate();
    }
    @Given("Database connection is closed")
    public void database_connection_is_closed() {
        DBUtils.closeConnection();
    }
}
