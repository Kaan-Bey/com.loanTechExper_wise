package stepdefinitions;

import io.cucumber.java.en.Given;
import java.util.Arrays;
import static hooks.HooksAPI.spec;

public class API_UserStepdefinitions {

    String exceptionMesaj="";
    public static String fullPath;

    @Given("API user sets {string} path parameters.")
    public void apı_user_sets_path_parameters(String rawPaths) {

        String[] paths = rawPaths.split("/");

        System.out.println(Arrays.toString(paths));

        StringBuilder tempPath = new StringBuilder("/{");


        for (int i = 0; i < paths.length; i++) {

            String key = "pp" + i;
            String value = paths[i].trim();

            spec.pathParam(key, value);

            tempPath.append(key + "}/{");
        }
        tempPath.deleteCharAt(tempPath.lastIndexOf("/"));
        tempPath.deleteCharAt(tempPath.lastIndexOf("{"));

        fullPath = tempPath.toString();
        System.out.println("fullPath = " + fullPath);

    }
}
