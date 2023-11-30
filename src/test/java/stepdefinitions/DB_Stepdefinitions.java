package stepdefinitions;

import com.github.javafaker.Faker;
import com.mysql.cj.Query;
import com.mysql.cj.protocol.Resultset;
import io.cucumber.java.en.Given;
import org.hamcrest.Matcher;
import org.hamcrest.MatcherAssert;
import org.junit.Assert;
import utilities.DBUtils;
import utilities.Manage;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static org.junit.Assert.*;

public class DB_Stepdefinitions {
    String query;
    ResultSet rs;
    PreparedStatement preparedStatement;
    Faker faker = new Faker();
    Manage manage = new Manage();
    protected String loan_number;
    protected int user_id;
    protected int id;
    protected String token;
     String e_mail;

    @Given("Database connection is established.")
    public void database_connection_is_established() {
        DBUtils.createConnection();
    }

    @Given("Update the {string} of the usernames with the penultimate letter e in the Users table")
    public void update_the_mobile_number_of_the_usernames_with_the_penultimate_letter_e_in_the_users_table(String mobileNumber) throws SQLException {
        query = manage.getQuery17();
        preparedStatement = DBUtils.getPraperedStatement(query);
        preparedStatement.setString(1, mobileNumber);
        int rowCount = preparedStatement.executeUpdate();
        assertEquals(1, rowCount);
    }

    @Given("Database connection is closed")
    public void database_connection_is_closed() {
        DBUtils.closeConnection();
    }

    @Given("Query is prepared and executed.")
    public void query_is_prepared_and_executed() throws SQLException {
        query = manage.getQuery01();
        rs = DBUtils.getStatement().executeQuery(query);

    }

    @Given("Results are obtained.")
    public void Results_are_obtained() throws SQLException {
        rs.next();
        Integer actual = rs.getInt("user_id");
        Integer user_idExpected = 1;
        assertEquals(user_idExpected, actual);
    }

    @Given("{string} is prepared and executed.")
    public void is_prepared_and_executed(String query) throws SQLException {
        query = manage.getQuery02();
        rs = DBUtils.getStatement().executeQuery(query);
    }

    @Given("Verify the {string} information Results are obtained.")
    public void verify_the_information_results_are_obtained(String column) throws SQLException {
        rs.next();
        String rToken = rs.getString(column);
        String expToken = "sH3BH9e6YvLn1543QeyAhupgJiLrTQvNFXSLmTQMid8ZuISCz7EUwwgMnozF";
        assertEquals(expToken, rToken);
    }

    @Given("cron_schedules_Query is prepared and executed.")
    public void cron_schedules_query_is_prepared_and_executed() throws SQLException {
        query = manage.getQuery03();
        rs = DBUtils.getStatement().executeQuery(query);
    }

    @Given("name Results are obtained.")
    public void name_results_are_obtained() throws SQLException {
        List<String> names = new ArrayList<>();
        while (rs.next()) {
            String name = rs.getString("name");
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
        query = manage.getQuery04();
        rs = DBUtils.getStatement().executeQuery(query);
    }

    @Given("{string} value of the data Results are obtained.")
    public void value_of_the_data_results_are_obtained(String Column) throws SQLException {
        List<Double> charges = new ArrayList<>();
        charges.add(106.00000000);
        charges.add(102.00000000);
        List<Double> actualcharge = new ArrayList<>();
        while (rs.next()) {
            Double charge = rs.getDouble("charge");
            actualcharge.add(charge);
            for (int i = 0; i < actualcharge.size(); i++) {
                assertEquals(charges.get(i), actualcharge.get(i));
            }
        }

    }

    @Given("admin_password_resets_Query is prepared and executed.")
    public void admin_password_resets_query_is_prepared_and_executed() throws SQLException {
        query = manage.getQuery05();
        id = faker.number().numberBetween(8, 50);
        e_mail=faker.internet().emailAddress();
        token = faker.internet().password();
        System.out.println(id +" "+e_mail+" "+token);
        preparedStatement = DBUtils.getPraperedStatement(query);
        preparedStatement.setInt(1, id);
        preparedStatement.setString(2, e_mail);
        preparedStatement.setString(3, token);
        preparedStatement.setInt(4, 0);


    }

    @Given("Data Results are obtained.")
    public void data_results_are_obtained() throws SQLException {
        int rowCount = preparedStatement.executeUpdate();
        assertEquals(1, rowCount);
    }

    @Given("Query06 is prepared and executed.")
    public void query06_is_prepared_and_executed() throws SQLException {
        query = manage.getQuery06();
        rs = DBUtils.getStatement().executeQuery(query);
    }

    @Given("Verify the support_ticket_id information Results are obtained.")
    public void verify_the_support_ticket_id_information_results_are_obtained() throws SQLException {
        rs.next();
        int support_ticket_id = rs.getInt("support_ticket_id");
        int exp_s_t_id = 3;
        assertEquals(exp_s_t_id, support_ticket_id);
    }

    @Given("Query07 is prepared and executed.")
    public void query07_is_prepared_and_executed() throws SQLException {
        query = manage.getQuery07();
        rs = DBUtils.getStatement().executeQuery(query);
    }

    @Given("Verify the subject information Results are obtained.")
    public void verify_the_subject_information_results_are_obtained() throws SQLException {
        List<String> expectedsubjectinfo = new ArrayList<>();
        expectedsubjectinfo.add("kargo takıp");
        expectedsubjectinfo.add("Plan2");
        List<String> actualsubject = new ArrayList<>();
        while (rs.next()) {
            String subject = rs.getString("subject");
            actualsubject.add(subject);
            for (int i = 0; i < actualsubject.size(); i++) {
                assertEquals(expectedsubjectinfo.get(i), actualsubject.get(i));
            }
        }
    }

    @Given("Query08 is prepared and executed.")
    public void query08_is_prepared_and_executed() throws SQLException {
        query = manage.getQuery08();
        rs = DBUtils.getStatement().executeQuery(query);
    }

    @Given("Verify the firstname,lastname information Results are obtained.")
    public void verify_the_firstname_lastname_information_results_are_obtained() throws SQLException {
        List<String> expectedList = new ArrayList<>();
        expectedList.add("john Doe");
        expectedList.add("test_Ozge Last_ozge");
        expectedList.add("smile last");
        List<String> actualList = new ArrayList<>();
        while (rs.next()) {
            String f_name = rs.getString("firstname") + " " + rs.getString("lastname");
            actualList.add(f_name);
            for (int i = 0; i < actualList.size(); i++) {
                assertEquals(expectedList.get(i), actualList.get(i));
            }
        }
        //john	Doe
        //test_Ozge	Last_ozge
        //smile	last

    }

    @Given("Query09 is prepared and updated.")
    public void query09_is_prepared_and_updated() throws SQLException {
        query = manage.getQuery09();
        loan_number = faker.internet().password();
        user_id = faker.number().numberBetween(10, 100);
        int plan_id = faker.number().numberBetween(0, 1);
        //i System.out.println(loan_number+user_id+plan_id);
        preparedStatement = DBUtils.getPraperedStatement(query);
        preparedStatement.setString(1, loan_number);
        preparedStatement.setInt(2, user_id);
        preparedStatement.setInt(3, plan_id);
        int rowCount = preparedStatement.executeUpdate();
        assertEquals(rowCount, 1);

    }

    @Given("Loan_number is prepared and deleted")
    public void loan_number_is_prepared_and_deleted() throws SQLException {
        query = manage.getQuery09delete();
        preparedStatement = DBUtils.getPraperedStatement(query);
        preparedStatement.setString(1, loan_number);
    }

    @Given("Verifies that the query information has been deleted.")
    public void verify_that_the_query_information_has_been_deleted() throws SQLException {
        int rowCount = preparedStatement.executeUpdate();
        assertEquals(rowCount, 1);
    }

    @Given("Query10 is prepared and updated.")
    public void query10_is_prepared_and_updated() throws SQLException {
        query = manage.getQuery10();
        token = faker.internet().password();
        int is_app = faker.number().randomDigitNotZero();
        preparedStatement = DBUtils.getPraperedStatement(query);
        preparedStatement.setInt(1, id);
        preparedStatement.setInt(2, user_id);
        preparedStatement.setInt(3, is_app);
        preparedStatement.setString(4, token);
    }

    @Given("Query11 is prepared and executed.")
    public void query11_is_prepared_and_executed() throws SQLException {
        query = manage.getQuery11();
        rs = DBUtils.getStatement().executeQuery(query);
    }

    @Given("Verify the number of users with {string}")
    public void verify_the_number_of_users_with(String user_id) throws SQLException {
        rs.next();
        int expectedcount = 6;
        int actualcount = rs.getInt("COUNT(*)");
        assertEquals(expectedcount, actualcount);

    }

    @Given("Query12 is prepared and executed.")
    public void query12_is_prepared_and_executed() throws SQLException {
        query = manage.getQuery12();
        rs = DBUtils.getStatement().executeQuery(query);
    }

    @Given("Verify the {string} of users with {string}")
    public void verify_the_of_users_with(String user_id, String id) throws SQLException {
        rs.next();
        int expectedcount = 2;
        int actualcount = rs.getInt("COUNT(*)");
        assertEquals(expectedcount, actualcount);
    }

    @Given("Query13 is prepared and updated")
    public void query13_is_prepared_and_updated() throws SQLException {
        query = manage.getQuery13();
        Date created_at = Date.valueOf(LocalDate.now());
        int cron_job_id = faker.number().randomDigitNotZero();
        Date start_at = Date.valueOf(LocalDate.now());
        int duration = faker.number().numberBetween(0, 50);
        String error = faker.name().title();
        //id,cron_job_id,start_at,end_at,duration,error,created_at
        id = faker.number().numberBetween(8, 50);
        preparedStatement = DBUtils.getPraperedStatement(query);
        preparedStatement.setInt(1, id);
        preparedStatement.setInt(2, cron_job_id);
        preparedStatement.setDate(3, start_at);
        preparedStatement.setString(4, null);
        preparedStatement.setInt(5, duration);
        preparedStatement.setString(6, error);
        preparedStatement.setDate(7, created_at);
    }

    @Given("Query14 is prepared and executed")
    public void query14_is_prepared_and_executed() throws SQLException {
        query = manage.getQuery14();
        rs = DBUtils.getStatement().executeQuery(query);
    }

    @Given("Verify the  List the {int} highest {string} values")
    public void verify_the_list_the_highest_values(Integer int1, String column) throws SQLException {
        List<Integer> codes = new ArrayList<>();
        List<Integer> expccodes = new ArrayList<>();
        expccodes.add(1000);
        expccodes.add(509);
        expccodes.add(508);
        expccodes.add(507);
        expccodes.add(506);

        while (rs.next()) {
            int code = rs.getInt("code");
            codes.add(code);
            for (int i = 0; i < codes.size(); i++) {
                assertEquals(expccodes.get(i), codes.get(i));
            }
        }
    }

    @Given("Query15 is prepared and executed")
    public void query15_is_prepared_and_executed() throws SQLException {
        query = manage.getQuery15();
        rs = DBUtils.getStatement().executeQuery(query);
    }

    @Given("Verify list the data that does not contain {string} in the {string}")
    public void verify_list_the_data_that_does_not_contain_in_the(String string, String string2) throws SQLException {
        assertFalse("Resultset boş", rs.next());

    }

    @Given("User_logins_Query prapered and executed")
    public void user_logins_query_prapered_and_executed() throws SQLException {
        query = manage.getQuery16();
        rs = DBUtils.getStatement().executeQuery(query);
    }

    @Given("Verify separate {string} by cities")
    public void verify_separate_by_cities(String string) throws SQLException {
        rs.next();
        int row = rs.getInt("city");
        assertEquals("4 şehir belirlendi", 4, row);
    }

    @Given("Catagories_table insertQuery is prepared and updated")
    public void catagories_table_insert_query_is_prepared_and_updated() throws SQLException {
        query = manage.getQuery18();
        id = faker.number().numberBetween(8, 50);
        String name = faker.expression("loan");
        String description = faker.lorem().sentence(4);
        preparedStatement = DBUtils.getPraperedStatement(query);
        //id,name,description
        preparedStatement.setInt(1, id);
        preparedStatement.setString(2, name);
        preparedStatement.setString(3, description);

    }

    @Given("List all records in the {string} table with {string} in reverse order and {string} in reverse order.")
    public void list_all_records_in_the_table_with_in_reverse_order_and_in_reverse_order(String users, String lastname, String firstname) throws SQLException {
        query = manage.getQuery19();
        rs = DBUtils.getStatement().executeQuery(query);
    }

    @Given("the first lastname of the list is verified")
    public void the_first_lastname_of_the_list_is_verified() throws SQLException {
        rs.next();
        String lastname = "zxcv";
        String actualLastname = rs.getString("lastname");
        Assert.assertEquals(lastname, actualLastname);
    }
    @Given("In the {string} table, find the sum of the {string} values according to the {string} type and verify the ones higher than ${int}")
    public void in_the_table_find_the_sum_of_the_values_according_to_the_type_and_verify_the_ones_higher_than_$(String string, String total_amount, String string3, Integer int1) throws SQLException {
        query=manage.getTransactionTable();
        rs=DBUtils.getStatement().executeQuery(query);
    }
    @Given("{string} values list is verified")
    public void total_amount_values_list_is_verified(String total_amount) {
        List<Object>actual_total_amount=DBUtils.getColumnData(query,"total_amount");
       //  System.out.println(DBUtils.getColumnData(query, total_amount));

        for (int i = 0; i <actual_total_amount.size() ; i++) {
            assertTrue(actual_total_amount.retainAll(Collections.singleton("1000")));      }
  
    }
    @Given("admin_notifications_table Query is prepared and executed")
    public void admin_notifications_table_query_is_prepared_and_executed() throws SQLException {
        query=manage.getQuery21();
        rs=DBUtils.getStatement().executeQuery(query);
    }
    @Given("User result values are validated")
    public void user_result_values_are_validated() throws SQLException {
       rs.next();
       Object actualCount=rs.getInt("COUNT(*)");
        assertEquals(0,actualCount);


    }
    @Given("e_mail is prepared for admin_password_resets query and status is updated.")
    public void admin_password_resets_query_is_prepared_and_updated() throws SQLException {
        query=manage.getQuery22();
        System.out.println(e_mail);
        preparedStatement=DBUtils.getPraperedStatement(query);
        preparedStatement.setInt(1,1);
        preparedStatement.setString(2,e_mail);
        System.out.println(e_mail);

    }
    @Given("Data Results are validate.")
    public void data_results_are_validate() throws SQLException {
       int row= preparedStatement.executeUpdate();
        assertEquals(1,row);

    }
    @Given("depositsTable is prepared and executed.")
    public void deposits_table_is_prepared_and_executed() throws SQLException {
       query=manage.getDepositsTotalAmount();
        rs=DBUtils.getStatement().executeQuery(query);
    }
    @Given("Deposits result values are validated")
    public void deposits_result_values_are_validated() throws SQLException {
       rs.next();
       int expected_total_amount=14476;  int actual_total_amount=rs.getInt("total_amount");
       assertEquals(expected_total_amount,actual_total_amount);

    }

    @Given("UpdateQuery is prepared")
    public void update_query_is_prepared() {

    }





}



