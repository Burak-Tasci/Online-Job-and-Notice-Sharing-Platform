package UI;

import DatabaseConnection.DB_Config;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;

import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.util.ArrayList;
import java.util.ResourceBundle;

public class AnaSayfaController implements Initializable {

    //setting database connection
    Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName ="+DB_Config.DatabaseName, DB_Config.UserName, DB_Config.Password);
    Statement statement = conn.createStatement();

    //declaring fxml variables
    @FXML
    private TextArea FlowText;
    @FXML
    private Button ToMainPage;
    @FXML
    private Button ToProfile;
    @FXML
    private Button ToPreparePost;
    @FXML
    private Button ToMakeConnection;
    @FXML
    public AnchorPane AnaSayfaJobAd;
    @FXML
    public AnchorPane AnaSayfaFlow;
    @FXML
    public TextArea AnaSayfaConn = new TextArea();


    //empty constructor that throws SQLException to can use statement everwhere in the class
    public AnaSayfaController() throws SQLException {
    }

    //overriding "initialize" abstract method to communicate with ui
    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

        //calling insert connections method
        InsertConnections();
        //calling insert posts method
        try {
            InsertPosts();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        //this action opens main page
        ToMainPage.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {


                try {
                    Main.root = FXMLLoader.load(getClass().getResource("AnaSayfa.fxml"));
                    Main.stage.setScene(new Scene(Main.root, 800, 600));
                    Main.stage.show();
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                }

            }
        });


        //this action opens profile page
        ToProfile.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {

                try {
                    //Taking profile values with this method
                    TakeProfileValues();


                    //in the below, we are directing to profile type for our sign in type
                    if (Main.ACCOUNT_TYPE == "User")
                    {
                        Main.root = FXMLLoader.load(getClass().getResource("UserProfile.fxml"));
                    }
                    else if (Main.ACCOUNT_TYPE == "Student")
                    {
                        Main.root = FXMLLoader.load(getClass().getResource("StudentProfile.fxml"));
                    }
                    else if (Main.ACCOUNT_TYPE == "Graduated")
                    {
                        Main.root = FXMLLoader.load(getClass().getResource("GraduatedProfile.fxml"));
                    }
                    else if (Main.ACCOUNT_TYPE == "Employee")
                    {
                        Main.root = FXMLLoader.load(getClass().getResource("EmployeeProfile.fxml"));
                    }
                    else if (Main.ACCOUNT_TYPE == "Unemployed")
                    {
                        Main.root = FXMLLoader.load(getClass().getResource("GraduatedProfile.fxml"));
                    }
                    else if (Main.ACCOUNT_TYPE == "LookingForJob")
                    {
                        Main.root = FXMLLoader.load(getClass().getResource("EmployeeProfile.fxml"));
                    }
                    else if (Main.ACCOUNT_TYPE == "LookingForEmployee")
                    {
                        Main.root = FXMLLoader.load(getClass().getResource("EmployeeProfile.fxml"));
                    }

                    //setting scene to stage and showing
                    Scene profile = new Scene(Main.root, 400, 600);
                    Main.stage.setScene(profile);
                    Main.stage.show();


                }
                catch (IOException e)
                {
                    e.printStackTrace();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        });

        //this action opens prepare post page
        ToPreparePost.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {

                try {
                    Main.root = FXMLLoader.load(getClass().getResource("PostHazirla.fxml"));
                    Main.stage.setScene(new Scene(Main.root, 400, 400));
                    Main.stage.show();
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                }
            }
        });

        //this action opens make connection page
        ToMakeConnection.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {

                try {
                    Main.root = FXMLLoader.load(getClass().getResource("BaglantiKur.fxml"));
                    Main.stage.setScene(new Scene(Main.root, 400, 400));
                    Main.stage.show();
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                }

            }
        });



    }

    //method that inserts posts to main page
    private void InsertPosts() throws SQLException {
        //we are clearing static variable that stores our account informations
        Main.PostTexts.clear();
        //declaring a PostHazirlaController class for accesing its method and use it for adding posts to main page
        PostHazirlaController c = new PostHazirlaController();
        c.GetPosts();
        String txt = "";
        //initializing all posts to text
        for(int i=0;i<Main.PostTexts.size();i++)
            txt+=Main.PostTexts.get(i);
        //setting text to mainpage if its not empty
        if (txt != "")
            FlowText.setText(txt+"----------------------------");

    }

    //taking profile values from database by methods for each type of account
    public void TakeProfileValues() throws SQLException {


        if (Main.ACCOUNT_TYPE == "User")
        {
            TakeSimpleData();
            TakeEducation();
            TakeLanguages();
            TakeCertificates();
        }

        else if (Main.ACCOUNT_TYPE == "Student")
        {
            TakeSimpleData();
            TakeEducation();
            TakeLanguages();
            TakeCertificates();
            TakeGraduateYear();
        }
        else if (Main.ACCOUNT_TYPE == "Graduated")
        {
            TakeSimpleData();
            TakeEducation();
            TakeLanguages();
            TakeCertificates();
            TakeGraduateYear();
            TakeGPA();
        }
        else if (Main.ACCOUNT_TYPE == "Employee")
        {
            TakeSimpleData();
            TakeEducation();
            TakeLanguages();
            TakeCertificates();
            TakeGraduateYear();
            TakeGPA();
            TakeExperience();
        }
        else if (Main.ACCOUNT_TYPE == "Unemployed")
        {
            TakeSimpleData();
            TakeEducation();
            TakeLanguages();
            TakeCertificates();
            TakeGraduateYear();
            TakeGPA();
        }
        else if (Main.ACCOUNT_TYPE == "LookingForJob")
        {
            TakeSimpleData();
            TakeEducation();
            TakeLanguages();
            TakeCertificates();
            TakeGraduateYear();
            TakeGPA();
            TakeExperience();
        }
        else if (Main.ACCOUNT_TYPE == "LookingForEmployee")
        {
            TakeSimpleData();
            TakeEducation();
            TakeLanguages();
            TakeCertificates();
            TakeGraduateYear();
            TakeGPA();
            TakeExperience();
        }

    }
    //simpledata means name, surname, age,mail and date
    public void TakeSimpleData() throws SQLException {

        //declaring its as null or 0 for can check they later
        Main.Name = null;
        Main.Surname = null;
        Main.Age = 0;
        Main.Mail = null;
        Main.date = null;

        //setting connection
        Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName ="+ DB_Config.DatabaseName, "sa", "sqlserver,78987");
        Statement statement = conn.createStatement();

        //user info query
        String GetUserInfo = "SELECT * FROM [User] WHERE [User-ID] = "+Main.LOGGED_USER_ID;
        //running query
        ResultSet resultSet = statement.executeQuery(GetUserInfo);
        //if resultset is not empty, we are getting simple datas
        if (resultSet.next())
        {
            Main.Name = resultSet.getString("Name");
            Main.Surname = resultSet.getString("Surname");
            Main.Age = resultSet.getInt("Age");
            Main.Mail = resultSet.getString("Mail");
            Main.date = resultSet.getDate("SigninDate");

        }
        //closing resultset
        resultSet.close();

    }
    public void TakeEducation() throws SQLException {

        //initializing school steps null
        Main.Primary = null;
        Main.Secondry = null;
        Main.HighSchool = null;
        Main.University = null;
        Main.Extra = null;

        //setting connection
        Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName ="+ DB_Config.DatabaseName, "sa", "sqlserver,78987");
        Statement statement = conn.createStatement();

        //query that for getting education id
        String GetEducationID = "SELECT [Education-ID] as EducationID FROM [User-Education] WHERE [User-ID] = "+Main.LOGGED_USER_ID;
        //running query
        ResultSet rs = statement.executeQuery(GetEducationID);

        //initializing edu_id to 0 for checking it later
        int edu_id = 0;
        //getting edu_id from database
        if(rs.next())
        {
            edu_id = rs.getInt(1);
        }
        rs.close();
        //getting education info query
        String GetEducationInfo = "SELECT Primary_School,Secondry_School,High_School,University,Extra FROM [Education] WHERE id = "+edu_id;
        //running query
        ResultSet edu_rs = statement.executeQuery(GetEducationInfo);


        //getting education info
        if (edu_rs.next())
        {
            Main.Primary = edu_rs.getString(1);
            Main.Secondry = edu_rs.getString(2);
            Main.HighSchool = edu_rs.getString(3);
            Main.University = edu_rs.getString(4);
            Main.Extra = edu_rs.getString(5);
        }
        edu_rs.close();

    }
    public void TakeLanguages() throws SQLException {

        //clearing languages
        Main.Languages.clear();

        //setting connection
        Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName ="+ DB_Config.DatabaseName, "sa", "sqlserver,78987");
        Statement statement = conn.createStatement();

        //getting connection language id query
        String GetLanguageID ="SELECT [Language-ID] FROM [User-Languages] WHERE [User-ID] = "+Main.LOGGED_USER_ID;
        //running query
        ResultSet rs1 = statement.executeQuery(GetLanguageID);
        //declaring an arraylist for storing languages
        ArrayList<Integer> languages = new ArrayList<Integer>();
        //getting all languages that user know
        while (rs1.next())
        {
            languages.add(rs1.getInt(1));
        }
        rs1.close();
        //preparing languages' ids for can use it with query
        String LanguagesID = "(";

        for(int i = 0; i<languages.size();i++)
        {
            if(i != languages.size()-1)
            {
                LanguagesID = LanguagesID+languages.get(i)+",";
            }
            else
            {
                LanguagesID = LanguagesID+languages.get(i)+")";
            }

        }

        //getting languages query
        String GetLanguages = "SELECT Language FROM Languages WHERE id in "+LanguagesID;
        if (LanguagesID != "(")
        {
            ResultSet lan_rs = statement.executeQuery(GetLanguages);
            while (lan_rs.next())
            {
                //adding languages to Languages arraylist for can use it in profile page
                Main.Languages.add(lan_rs.getString("Language"));
            }
            lan_rs.close();

        }
    }
    public void TakeCertificates() throws SQLException {

        //clearing certificates arraylist
        Main.Certificates.clear();

        //setting connection
        Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName ="+ DB_Config.DatabaseName, "sa", "sqlserver,78987");
        Statement statement = conn.createStatement();

        //getting certificates ids query
        String GetCertificateID ="SELECT [Certificate-ID] FROM [User-Certificate] WHERE [User-ID] = "+Main.LOGGED_USER_ID;
        //running it
        ResultSet resultSet1 = statement.executeQuery(GetCertificateID);
        //declaring certificates arraylist
        ArrayList<Integer> certificates = new ArrayList<Integer>();
        //filling it with users certificate ids
        while (resultSet1.next())
        {
            certificates.add(resultSet1.getInt(1));
        }
        resultSet1.close();
        String CertificatesID = "(";
        //preparing arraylist to for can use it with query
        for(int i = 0; i<certificates.size();i++)
        {
            if(i != certificates.size()-1)
            {
                CertificatesID = CertificatesID+certificates.get(i)+",";
            }
            else
            {
                CertificatesID = CertificatesID+certificates.get(i)+")";
            }

        }

        //selecting certificates query
        String GetCertificates = "SELECT Certificate FROM Certificates WHERE id in "+CertificatesID;
        if (CertificatesID != "(")
        {
            ResultSet cer_rs = statement.executeQuery(GetCertificates);
            while (cer_rs.next())
            {
                Main.Certificates.add(cer_rs.getString("Certificate"));
            }
            cer_rs.close();
        }
    }
    public void TakeGraduateYear() throws SQLException{

        //clearing static graduateyear variable
        Main.GraduateYear = null;

        //setting connection
        Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName ="+ DB_Config.DatabaseName, "sa", "sqlserver,78987");
        Statement statement = conn.createStatement();

        //declaring id variable to store users account type's id
        int id = 0;

        //getting id query
        String GetID = "SELECT ["+Main.ACCOUNT_TYPE+"-ID] FROM [User-"+Main.ACCOUNT_TYPE+"]  WHERE [User-ID] = "+ Main.LOGGED_USER_ID;
        System.out.println(GetID);
        //running it
        ResultSet rs_id = statement.executeQuery(GetID);
        if(rs_id.next())
        {
            id = rs_id.getInt(1);
        }
        System.out.println(id);

        //getting graduate year query and its running function
        String GetGraduateYear = "SELECT [GraduateYear] FROM ["+Main.ACCOUNT_TYPE+"] WHERE ["+Main.ACCOUNT_TYPE+"-ID] =" + id;
        System.out.println(GetGraduateYear);
        ResultSet rs = statement.executeQuery(GetGraduateYear);
        if(rs.next())
        {
            Main.GraduateYear = rs.getString(1);
        }

    }
    public void TakeGPA() throws SQLException{

        //clearing gpa
        Main.GradePointAverage = 0.0;
        //setting connection
        Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName ="+ DB_Config.DatabaseName, "sa", "sqlserver,78987");
        Statement statement = conn.createStatement();

        //declaring id
        int id = 0;

        //getting account type id and initializing it to id
        String GetID = "SELECT ["+Main.ACCOUNT_TYPE+"-ID] FROM [User-"+Main.ACCOUNT_TYPE+"]  WHERE [User-ID] = "+ Main.LOGGED_USER_ID;
        System.out.println(GetID);
        ResultSet rs_id = statement.executeQuery(GetID);
        if(rs_id.next())
        {
            id = rs_id.getInt(1);
        }
        System.out.println(id);

        //getting gpa from database
        String GetGradePointAverage = "SELECT [GradePointAverage] FROM ["+Main.ACCOUNT_TYPE+"] WHERE ["+Main.ACCOUNT_TYPE+"-ID] =" + id;
        System.out.println(GetGradePointAverage);
        ResultSet rs = statement.executeQuery(GetGradePointAverage);
        if(rs.next())
        {
            Main.GradePointAverage = rs.getDouble(1);
        }


    }
    public void TakeExperience() throws SQLException{

        //clearing experience
        Main.Experience = 0;
        //setting connection
        Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName ="+ DB_Config.DatabaseName, "sa", "sqlserver,78987");
        Statement statement = conn.createStatement();

        //declaring id
        int id = 0;
        //getting account type id
        String GetID = "SELECT ["+Main.ACCOUNT_TYPE+"-ID] FROM [User-"+Main.ACCOUNT_TYPE+"]  WHERE [User-ID] = "+ Main.LOGGED_USER_ID;
        System.out.println(GetID);
        ResultSet rs_id = statement.executeQuery(GetID);
        if(rs_id.next())
        {
            id = rs_id.getInt(1);
        }
        System.out.println(id);

        //getting experience from database
        String GetExperience = "SELECT [Experience] FROM ["+Main.ACCOUNT_TYPE+"] WHERE ["+Main.ACCOUNT_TYPE+"-ID] =" + id;
        System.out.println(GetExperience);
        ResultSet rs = statement.executeQuery(GetExperience);
        if(rs.next())
        {
            Main.Experience = rs.getInt(1);
        }



    }
    public void TakeConnections() throws SQLException{

        //clearing connections
        Main.Connections.clear();
        //Getting Connections From Database And Putting them into Main.Connections
        String MyConnections = "SELECT [User2-ID] FROM [Connections] WHERE [User1-ID] = " + Main.LOGGED_USER_ID;
        ResultSet conrs = statement.executeQuery(MyConnections);
        while(conrs.next())
        {
            Main.Connections.add(String.valueOf(conrs.getInt(1)));
        }



    }
    public void InsertConnections()
    {
        //Taking connections with method
        try {
            TakeConnections();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        //preparing connections arraylist to use in query
        String ids = "(";

        for(int i = 0; i<Main.Connections.size();i++)
        {
            if(i != Main.Connections.size()-1)
            {
                ids = ids+Main.Connections.get(i)+",";
            }
            else
            {
                ids = ids+Main.Connections.get(i)+")";
            }

        }
        //an arraylist for storing connections
        ArrayList<String> temp = new ArrayList<String>();
        //getting connection names and surnames
        if (ids != "(")
        {
            String ConnsNum2Str = "SELECT [Name] + ' ' + [Surname] as NameSurname FROM [User] WHERE [User-ID] in "+ids;
            try {
                ResultSet conrs = statement.executeQuery(ConnsNum2Str);
                while(conrs.next())
                {
                    temp.add(conrs.getString("NameSurname"));
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            //preparing text variable to use it in mainpage
            System.out.println(temp);
            String text = "  ";
            for(String i:temp)
            {

                text+=i+"\n  ";
            }
            System.out.println(text);



            System.out.println(CapitalizeFirsts(text));
            //setting text to connections side in mainpage
            AnaSayfaConn.setText(CapitalizeFirsts(text));

        }
    }
    //a method for capitalizing name and surnames first characters
    public static String CapitalizeFirsts(String s)
    {
        char temp = 0;
        char[] chars = s.toCharArray();
        for (int i = 0; i<chars.length;i++)
        {
            if (i == 0)
                chars[i] = Character.toUpperCase(chars[i]);
            if (temp == ' ' && chars[i] != ' ')
            {

                chars[i] = Character.toUpperCase(chars[i]);
            }

            temp = chars[i];

        }
        s = "";
        for (char c: chars)
        {
            s = s+c;
        }
        return s;
    }
}

