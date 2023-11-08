package utilities;

public class Manage {


    public String getQuery18() {
        return Query18;
    }

    private  String Query18="UPDATE users set mobile =? where username LIKE '%e_';";
}
