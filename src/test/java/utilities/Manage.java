package utilities;

public class Manage {
    private String Query17 = "UPDATE users set mobile =? where username LIKE '%e_';";
    private String Query01 = "SELECT user_id FROM deposits Where amount > 100 And amount <500;";
    private String Query02 = "SELECT remember_token FROM admins Where email='info@loantechexper.com';";

    private String Query03 = "SELECT name from cron_schedules Order By created_at Desc LIMIT 2;";

    private String Query04 = "Select charge from deposits Where amount<500.000;";
    private String Query05 = "Insert into admin_password_resets (id,email,token,status,created_at) Values(?,?,?,?,now());";
    private String Query06 = "select support_ticket_id from support_messages Where message='deneme_message';";
    private String Query07 = "select subject from support_tickets Where ticket Like '4%';";

    public String getQuery08() {
        return Query08;
    }

    private String Query08 = "select firstname,lastname from users Where country_code Not Like'%TR%';";
    private String Query09 = "Insert into loans (loan_number,user_id,plan_id) Values(?,?,?);";
    private String Query10 = "Insert into device_tokens (id,user_id,is_app,token,created_at) Values(?,?,?,?,now());";

    public String getQuery09delete() {
        return Query09delete;
    }

    private String Query09delete = "Delete  from loans Where loan_number=?;";

    public String getQuery09() {
        return Query09;
    }

    public String getQuery10() {
        return Query10;
    }

    public String getQuery01() {
        return Query01;
    }

    public String getQuery02() {
        return Query02;
    }

    public String getQuery03() {
        return Query03;
    }

    public String getQuery04() {
        return Query04;
    }

    public String getQuery05() {
        return Query05;
    }

    public String getQuery06() {
        return Query06;
    }

    public String getQuery07() {
        return Query07;
    }

    public String getQuery17() {
        return Query17;
    }
}
