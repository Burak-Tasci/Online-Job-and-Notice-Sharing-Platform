package UI;

import DatabaseConnection.DB_Config;
import com.microsoft.sqlserver.jdbc.SQLServerException;
import com.sun.javafx.font.freetype.HBGlyphLayout;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;

import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ResourceBundle;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.input.MouseEvent;

public class EditPageController implements Initializable{

    Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName ="+ DB_Config.DatabaseName, "sa", "sqlserver,78987");
    Statement statement = conn.createStatement();

    @FXML
    private Button BackBtn;

    @FXML
    private TextField LanguageTextF;

    @FXML
    private TextField CertificatesTextF;

    @FXML
    private TextField PrimarySTextF;

    @FXML
    private TextField SecondrySTextF;

    @FXML
    private TextField HighSTextF;

    @FXML
    private TextField UniversityTextF;

    @FXML
    private TextField ExtraTextF;

    @FXML
    private ComboBox LanguageCombo;

    @FXML
    private ComboBox CertificatesCombo;

    @FXML
    private Button EduSubmitBtn;

    @FXML
    private Button AddLanguage;

    @FXML
    private Button AddCertificate;

    @FXML
    private Button RemoveLanguage;

    @FXML
    private Button RemoveCertificate;

    @FXML
    private TextField GPATextF;

    @FXML
    private TextField GraduateYearTextF;

    @FXML
    public Button OthersBtn;

    @FXML
    public TextField ExperienceText;

    public EditPageController() throws SQLException {
    }


    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

        //getting variables from main
        LanguageCombo.getItems().addAll(Main.Languages);
        CertificatesCombo.getItems().addAll(Main.Certificates);

        PrimarySTextF.setText(Main.Primary);
        SecondrySTextF.setText(Main.Secondry);
        HighSTextF.setText(Main.HighSchool);
        UniversityTextF.setText(Main.University);
        ExtraTextF.setText(Main.Extra);

        GraduateYearTextF.setText(Main.GraduateYear);
        GPATextF.setText(String.valueOf(Main.GradePointAverage));
        ExperienceText.setText(String.valueOf(Main.Experience));

        //this event directs user to profile page
        BackBtn.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {

                try {
                    ToProfile();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

            }
        });
        AddLanguage.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {

                //taking text and setting textfield to empty
                String Language = LanguageTextF.getText();
                LanguageTextF.setText("");

                //controlling that is there a language like user wrote
                String ControlLanguage = "SELECT id FROM [Languages] WHERE Language = '"+ Language+"'";
                int Lan_ID = 0;
                try {
                    ResultSet LanRS = statement.executeQuery(ControlLanguage);
                    if (LanRS.next())
                    {
                        Lan_ID = LanRS.getInt("id");

                    }
                    else
                    {
                        Alert alert = new Alert(Alert.AlertType.WARNING);
                        //Setting the title
                        alert.setTitle("Alert");
                        ButtonType type = new ButtonType("Ok", ButtonBar.ButtonData.OK_DONE);
                        //Setting the content of the dialog
                        alert.setContentText("There is no language like that you write!");
                        //Adding buttons to the dialog pane
                        alert.getDialogPane().getButtonTypes().add(type);
                        //Setting the label
                        alert.showAndWait();
                    }

                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

                //inserting language to user-languages table
                String InsertLanguage = "INSERT INTO [User-Languages]([User-ID], [Language-ID]) VALUES("+Main.LOGGED_USER_ID+","+Lan_ID+") ";
                if (Lan_ID != 0)
                {
                    try {
                        statement.execute(InsertLanguage);
                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }
                }

            }
        });
        AddCertificate.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {

                //taking certificate and setting textfield to empty
                String Certificate = (String) CertificatesTextF.getText();
                CertificatesTextF.setText("");

                //selecting certificate query
                String ControlCertificate = "SELECT [id] FROM [Certificates] WHERE [Certificate] = '"+ Certificate+"'";
                int Cer_ID = 0;
                try {
                    //checking that is there a certificate in database what user wrote
                    //if there is we are initializing it to cer_id
                    ResultSet CerRS = statement.executeQuery(ControlCertificate);
                    if (CerRS.next())
                    {
                        Cer_ID = CerRS.getInt(1);

                    }
                    //if there is not we are inserting it to database and initializing it to cer_id
                    else
                    {
                        String InsertCertificate = "INSERT INTO [Certificates]([Certificate]) VALUES ('"+Certificate+"')";
                        statement.execute(InsertCertificate);
                        CerRS = statement.executeQuery(ControlCertificate);
                        if (CerRS.next())
                            Cer_ID = CerRS.getInt(1);
                    }

                } catch (SQLServerException e)
                {
                    e.printStackTrace();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

                String InsertUserCertificate = "INSERT INTO [User-Certificate]([User-ID], [Certificate-ID]) VALUES("+Main.LOGGED_USER_ID+","+Cer_ID+") ";
                System.out.println(InsertUserCertificate);
                if (Cer_ID != 0)
                {
                    try {
                        statement.execute(InsertUserCertificate);
                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }
                }


            }
        });

        RemoveLanguage.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {

                //taking choosed combobox text and deleting that language from user's languages
                String LanguageThatForRemove = (String) LanguageCombo.getValue();
                LanguageCombo.getItems().remove(LanguageThatForRemove);
                LanguageCombo.setItems(null);

                String LanguageRemoveQuery = "DELETE FROM [User-Languages] WHERE [User-ID] = "+Main.LOGGED_USER_ID+""+
                        "AND [Language-ID] = (SELECT [id] FROM Languages WHERE Language ="
                        +"'"+LanguageThatForRemove+"')";
                try {
                    statement.execute(LanguageRemoveQuery);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

            }
        });
        RemoveCertificate.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {
                //taking choosed combobox text and deleting that certificates from user's certificates

                String CertificateThatForRemove = (String) CertificatesCombo.getValue();
                CertificatesCombo.getItems().remove(CertificateThatForRemove);
                CertificatesCombo.setItems(null);

                String CertificateRemoveQuery = "DELETE FROM [User-Certificate] WHERE [User-ID] = "+
                        Main.LOGGED_USER_ID+" AND [Certificate-ID] = (SELECT [id] FROM Certificates WHERE [Certificate] = '"+CertificateThatForRemove+"')" ;

                try {
                    statement.execute(CertificateRemoveQuery);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }

            }
        });
        EduSubmitBtn.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {

                //we are declaring school variables

                String Primary = "";
                String Secondry = "";
                String HighSchool = "";
                String University = "";
                String Extra = "";

                //checking them and taking them
                if (PrimarySTextF.getText() != null) {
                    Primary = PrimarySTextF.getText();
                }
                if (SecondrySTextF.getText() != null) {
                    Secondry = SecondrySTextF.getText();
                }
                if (HighSTextF.getText() != null) {
                    HighSchool = HighSTextF.getText();
                }
                if (UniversityTextF.getText() != null) {
                    University = UniversityTextF.getText();
                }
                if (ExtraTextF.getText() != null) {
                    Extra = ExtraTextF.getText();
                }

                int edu_ID = 0;
                //getting user's education id and inserting it school variables
                String GetEducationIDQuery = "SELECT [Education-ID] FROM [User-Education] WHERE [User-ID] = "+Main.LOGGED_USER_ID;
                try  {
                    ResultSet eduID_rs = statement.executeQuery(GetEducationIDQuery);
                    if (eduID_rs.next())
                    {
                        edu_ID = eduID_rs.getInt(1);

                    }
                    else
                    {
                        String InsertEducation = "INSERT INTO [Education]([Primary_School], [Secondry_School], [High_School], [University], [Extra]) VALUES(NULL,NULL,NULL,NULL,NULL)";
                        statement.execute(InsertEducation);

                        String EduID = "SELECT TOP 1 [id] FROM [Education] ORDER BY [id] DESC";
                        ResultSet id_rs = statement.executeQuery(EduID);
                        if (id_rs.next())
                        {
                            edu_ID = id_rs.getInt(1);
                        }
                        String eduUser = "INSERT INTO [User-Education] VALUES("+Main.LOGGED_USER_ID+","+edu_ID+")";
                        statement.execute(eduUser);
                        System.out.println(eduUser);
                    }

                    System.out.println(edu_ID);

                    String UpdateEducationQuery = "UPDATE [Education] SET [Primary_School] = '"+Primary+"', [Secondry_School] = '"+Secondry+"', [High_School] = '"+HighSchool+"', [University] = '"+University+"', [Extra] = '" +
                            Extra+"' WHERE [id] = "+edu_ID;
                    System.out.println(UpdateEducationQuery);
                    statement.executeUpdate(UpdateEducationQuery);


                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        });
        OthersBtn.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {


                    //taking GraduateYear and inserting it
                    String GraduateYear = GraduateYearTextF.getText();
                //here is we are checking the variable's validness

                if(isValidDate(GraduateYear))
                    {


                        int id = 0;

                        String GetTypeID = "SELECT ["+Main.ACCOUNT_TYPE+"-ID] FROM [User-"+Main.ACCOUNT_TYPE+"] WHERE [User-ID] = "+Main.LOGGED_USER_ID;
                        System.out.println(GetTypeID);
                        try {
                            ResultSet rs = statement.executeQuery(GetTypeID);
                            if (rs.next())
                            {
                                id = rs.getInt(1);
                            }


                            System.out.println(id);
                            if(id != 0)
                            {
                                String SetGraduateYearQuery = "UPDATE ["+Main.ACCOUNT_TYPE+"] SET [GraduateYear] = '"+GraduateYear+"' WHERE ["+Main.ACCOUNT_TYPE+"-ID] = "+id;
                                System.out.println(SetGraduateYearQuery);

                                statement.execute(SetGraduateYearQuery);

                            }

                        } catch (SQLException throwables) {
                            throwables.printStackTrace();
                        }

                    }
                    else {
                    Alert alert = new Alert(Alert.AlertType.WARNING);
                    //Setting the title
                    alert.setTitle("Alert");
                    ButtonType type = new ButtonType("Ok", ButtonBar.ButtonData.OK_DONE);
                    //Setting the content of the dialog
                    alert.setContentText("Invalid Value!");
                    //Adding buttons to the dialog pane
                    alert.getDialogPane().getButtonTypes().add(type);
                    //Setting the label
                    alert.showAndWait();
                    }

                    //taking GPA and inserting it
                    String GPA = GPATextF.getText();
                    //here is we are checking the variable's validness
                    if (isValidGPA(GPA))
                    {


                        int id = 0;

                        String GetTypeID = "SELECT ["+Main.ACCOUNT_TYPE+"-ID] FROM [User-"+Main.ACCOUNT_TYPE+"] WHERE [User-ID] = "+Main.LOGGED_USER_ID;
                        System.out.println(GetTypeID);
                        try {
                            ResultSet rs = statement.executeQuery(GetTypeID);
                            if (rs.next())
                            {
                                id = rs.getInt(1);
                            }

                            System.out.println("222");
                            System.out.println(id);
                            if(id != 0)
                            {
                                System.out.println("asdads");
                                String SetGPAQuery = "UPDATE ["+Main.ACCOUNT_TYPE+"] SET [GradePointAverage] = "+GPA+" WHERE ["+Main.ACCOUNT_TYPE+"-ID] = "+id;
                                System.out.println(SetGPAQuery);

                                statement.execute(SetGPAQuery);

                            }

                        } catch (SQLException throwables) {
                            throwables.printStackTrace();
                        }
                    }
                    else {
                        Alert alert = new Alert(Alert.AlertType.WARNING);
                        //Setting the title
                        alert.setTitle("Alert");
                        ButtonType type = new ButtonType("Ok", ButtonBar.ButtonData.OK_DONE);
                        //Setting the content of the dialog
                        alert.setContentText("Invalid Value!");
                        //Adding buttons to the dialog pane
                        alert.getDialogPane().getButtonTypes().add(type);
                        //Setting the label
                        alert.showAndWait();
                    }

                    //taking Experience and inserting it
                    String Experience = ExperienceText.getText();
                    //here is we are checking the variable's validness
                    if (isValidExperience(Experience))
                    {
                        int id = 0;

                        String GetTypeID = "SELECT ["+Main.ACCOUNT_TYPE+"-ID] FROM [User-"+Main.ACCOUNT_TYPE+"] WHERE [User-ID] = "+Main.LOGGED_USER_ID;
                        System.out.println(GetTypeID);
                        try {
                            ResultSet rs = statement.executeQuery(GetTypeID);
                            if (rs.next())
                            {
                                id = rs.getInt(1);
                            }

                            System.out.println("222");
                            System.out.println(id);
                            if(id != 0)
                            {
                                System.out.println("asdads");
                                String SetExperienceQuery = "UPDATE ["+Main.ACCOUNT_TYPE+"] SET [Experience] = "+Experience+" WHERE ["+Main.ACCOUNT_TYPE+"-ID] = "+id;
                                System.out.println(SetExperienceQuery);

                                statement.execute(SetExperienceQuery);

                            }

                        } catch (SQLException throwables) {
                            throwables.printStackTrace();
                        }
                    }
                    else {
                        Alert alert = new Alert(Alert.AlertType.WARNING);
                        //Setting the title
                        alert.setTitle("Alert");
                        ButtonType type = new ButtonType("Ok", ButtonBar.ButtonData.OK_DONE);
                        //Setting the content of the dialog
                        alert.setContentText("Invalid Value!");
                        //Adding buttons to the dialog pane
                        alert.getDialogPane().getButtonTypes().add(type);
                        //Setting the label
                        alert.showAndWait();
                    }







                }

        });

    }
    //in this method, we are directing user to proper profile page that about user's account type
    public void ToProfile() throws SQLException {

        AnaSayfaController anaSayfaController = new AnaSayfaController();
        anaSayfaController.TakeProfileValues();


        try {
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


            Scene profile = new Scene(Main.root, 400, 600);
            Main.stage.setScene(profile);
            Main.stage.show();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
    public static boolean isValidDate(String inDate) {
        //determining date format
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        try {
            //trying to parse it, if it cannot method returns false value
            dateFormat.parse(inDate.trim());
        } catch (ParseException pe) {
            return false;
        }

        return true;
    }

    public static boolean isValidGPA(String GPA)
    {
        //checking false situations
        if(GPA.isBlank())
        {
            return false;
        }
        else if(GPA == null)
        {
            return false;
        }
        try
        {
            //trying to parse
            float i = Float.parseFloat(GPA);
            if(i>4.0 || i<0.0)
            {
                return false;
            }
            return true;

        }

        catch(NumberFormatException er)
        {
            return false;
        }


    }

    public static boolean isValidExperience(String Experience)
    {
        //checking false situations

        if(Experience.isBlank())
        {
            return false;
        }
        else if(Experience == null)
        {
            return false;
        }
        try
        {
            //trying to parse
            int i = Integer.parseInt(Experience);
            if(i<0)
            {
                return false;
            }
            return true;

        }

        catch(NumberFormatException er)
        {
            return false;
        }


    }
}
