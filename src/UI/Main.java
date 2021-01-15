package UI;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.stage.Stage;

import java.sql.Date;
import java.util.ArrayList;

public class Main extends Application {

    //these are variables to store account informations temporarly

    public static int LOGGED_USER_ID = 0;
    public static String ACCOUNT_TYPE;
    static Parent root;
    static Stage stage;

    static String Name = null;
    static String Surname = null;
    static int Age = 0;
    static String Mail = null;
    static Date date = null;

    static String Primary = null;
    static String Secondry = null;
    static String HighSchool = null;
    static String University = null;
    static String Extra = null;

    static ArrayList<String> Certificates = new ArrayList<>();
    static ArrayList<String> Languages = new ArrayList<>();

    static int Experience = 0;
    static double GradePointAverage  = 0.0;
    static String GraduateYear = null;

    static ArrayList<String> Connections = new ArrayList<>();
    static ArrayList<String> PostTexts = new ArrayList<>();

    //launching program
    @Override
    public void start(Stage primaryStage) throws Exception{
        stage = primaryStage;
        root = FXMLLoader.load(getClass().getResource("Giris.fxml"));
        stage.setTitle("BURAKIDN");
        stage.getIcons().add(new Image(getClass().getResourceAsStream("icon.png")));
        stage.setResizable(false);
        stage.setScene(new Scene(root, 800, 600));
        stage.show();
    }


    public static void main(String[] args) {
        launch(args);
    }
}
