package utilities;

public class Manage {
    private  String Query17="UPDATE users set mobile =? where username LIKE '%e_';";
    private String Query01="SELECT user_id FROM deposits Where amount > 100 And amount <500;";
    private String Query02="SELECT remember_token FROM admins Where email='info@loantechexper.com';";

    private String Query03="SELECT name from cron_schedules Order By created_at Desc LIMIT 2;";

    private String Query04="Select charge from deposits Where amount<500.000;";
    private String Query05="Insert into admin_password_resets (id,email,token,status) Values(?,?,?,?);";

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
    public String getQuery17() {
        return Query17;
    }
}
