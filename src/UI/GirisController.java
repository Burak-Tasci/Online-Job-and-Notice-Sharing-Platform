package UI;

import Classes.*;
import DatabaseConnection.DB_Config;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.fxml.Initializable;
import javafx.scene.input.MouseEvent;

import javax.management.Query;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.util.ResourceBundle;

public class GirisController implements Initializable {

    //connection setting
    Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName ="+DB_Config.DatabaseName, DB_Config.UserName, DB_Config.Password);
    Statement statement = conn.createStatement();

    //fxml variables
    @FXML
    private Button LogInButton;

    @FXML
    private Button SignInButton;

    @FXML
    private TextField MailLogIn;

    @FXML
    private PasswordField PasswordLogIn;

    @FXML
    private TextField NameSignIn;

    @FXML
    private TextField SurnameSignIn;

    @FXML
    private TextField AgeSignIn;

    @FXML
    private TextField MailSignIn;

    @FXML
    private PasswordField PasswordSignIn;

    @FXML
    private TextField CPasswordSignIn;

    @FXML
    private ComboBox TypeSignIn;


    public GirisController() throws SQLException {
    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

        //filling combobox
        TypeSignIn.getItems().add("User");
        TypeSignIn.getItems().add("Student");
        TypeSignIn.getItems().add("Graduated");
        TypeSignIn.getItems().add("Employee");
        TypeSignIn.getItems().add("Unemployed");
        TypeSignIn.getItems().add("LookingForJob");
        TypeSignIn.getItems().add("LookingForEmployee");

        //login button style
        LogInButton.setOnMousePressed(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {
                LogInButton.setStyle("-fx-background-color:white;" +
                        "-fx-background-radius:10;" +
                        "-fx-border-color:black;" +
                        "-fx-border-radius:10;");
            }
        });
        //login button style
        LogInButton.setOnMouseReleased(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {
                LogInButton.setStyle("-fx-background-color: #43AFB7;" +
                        "-fx-background-radius:10;" +
                        "-fx-border-color:black;" +
                        "-fx-border-radius:10;");
            }
        });
        //sign in button style
        SignInButton.setOnMousePressed(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {
                SignInButton.setStyle("-fx-background-color:white;" +
                        "-fx-background-radius:10;" +
                        "-fx-border-color:black;" +
                        "-fx-border-radius:10;");
            }
        });
        //sign in button style
        SignInButton.setOnMouseReleased(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {
                SignInButton.setStyle("-fx-background-color: #43AFB7;" +
                        "-fx-background-radius:10;" +
                        "-fx-border-color:black;" +
                        "-fx-border-radius:10;");
            }
        });
        //taking mail and password textfields and comparing it with database
        LogInButton.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {

                String mail = MailLogIn.getText();
                String password = PasswordLogIn.getText();

                MailLogIn.setText("");
                PasswordLogIn.setText("");

                String LogIn = "SELECT * FROM [User] WHERE Mail = '"+mail+"' AND Password = '"+password+"'";

                try {
                    ResultSet resultSet = statement.executeQuery(LogIn);
                    if(resultSet.next()) {
                         Main.LOGGED_USER_ID = resultSet.getInt(1);
                    }
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }



                if (Main.LOGGED_USER_ID != 0)
                {
                    Main.ACCOUNT_TYPE = LogInType();

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
                else
                {
                    Alert alert = new Alert(Alert.AlertType.WARNING);
                    //Setting the title
                    alert.setTitle("Alert");
                    ButtonType type = new ButtonType("Ok", ButtonBar.ButtonData.OK_DONE);
                    //Setting the content of the dialog
                    alert.setContentText("Wrong Password or Mail!");
                    //Adding buttons to the dialog pane
                    alert.getDialogPane().getButtonTypes().add(type);
                    //Setting the label
                    alert.showAndWait();
                }


            }
        });
        //taking user informations and inserting it to database
        SignInButton.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {

                String Name = NameSignIn.getText().trim();
                String Surname = SurnameSignIn.getText().trim();
                String tAge = AgeSignIn.getText().trim();
                int Age = -1;
                try {
                    Age = Integer.parseInt(tAge);
                }
                catch (NumberFormatException numberFormatException)
                {
                    Alert alert = new Alert(Alert.AlertType.WARNING);
                    //Setting the title
                    alert.setTitle("Alert");
                    ButtonType type = new ButtonType("Ok", ButtonBar.ButtonData.OK_DONE);
                    //Setting the content of the dialog
                    alert.setContentText("Wrong input for age!");
                    //Adding buttons to the dialog pane
                    alert.getDialogPane().getButtonTypes().add(type);
                    //Setting the label
                    alert.showAndWait();
                }
                String Mail = MailSignIn.getText().trim();
                String Password = null;
                if (CPasswordSignIn.getText().equals(PasswordSignIn.getText()))
                {
                    Password = PasswordSignIn.getText();
                }
                else
                {
                    Alert alert = new Alert(Alert.AlertType.WARNING);
                    //Setting the title
                    alert.setTitle("Alert");
                    ButtonType type = new ButtonType("Ok", ButtonBar.ButtonData.OK_DONE);
                    //Setting the content of the dialog
                    alert.setContentText("Passwords are not matching!");
                    //Adding buttons to the dialog pane
                    alert.getDialogPane().getButtonTypes().add(type);
                    //Setting the label
                    alert.showAndWait();
                }
                String Type = (String) TypeSignIn.getValue();


                try {
                    if (Type.equals("User"))
                    {
                        User user = new User(Name,Surname,Age,Mail,Password,Type);
                        user.AddUsertoDB();
                    }
                    else if (Type.equals("Student"))
                    {
                        Ogrenci ogrenci = new Ogrenci(Name,Surname,Age,Mail,Password,Type);
                        ogrenci.AddUsertoDB();
                        try {

                            String newStudent ="INSERT INTO Student(GraduateYear) VALUES (NULL)";
                            System.out.println(newStudent);
                            statement.execute(newStudent);

                            String getStudentID ="SELECT TOP 1 [Student-ID] FROM [Student] ORDER BY [Student-ID] DESC";
                            ResultSet resultSet = statement.executeQuery(getStudentID);

                            int id = 0;

                            if (resultSet.next())
                            {
                                id = resultSet.getInt(1);
                            }

                            String newStudentUser = "INSERT INTO [User-Student]([User-ID],[Student-ID]) VALUES ("+Main.LOGGED_USER_ID+","+id+")";
                            statement.execute(newStudentUser);

                        } catch (SQLException throwables) {
                            throwables.printStackTrace();
                        }
                    }
                    else if (Type.equals("Graduated"))
                    {
                        Mezun mezun = new Mezun(Name,Surname,Age,Mail,Password,Type);
                        mezun.AddUsertoDB();
                        try {

                            String newGraduated ="INSERT INTO Graduated(GraduateYear, GradePointAverage) VALUES (NULL, NULL)";
                            statement.execute(newGraduated);

                            String getGraduatedID ="SELECT TOP 1 [Graduated-ID] FROM [Graduated] ORDER BY [Graduated-ID] DESC";
                            System.out.println(getGraduatedID);
                            ResultSet resultSet = statement.executeQuery(getGraduatedID);

                            int id = 0;

                            if (resultSet.next())
                            {
                                id = resultSet.getInt(1);
                            }
                            System.out.println(id);
                            System.out.println(Main.LOGGED_USER_ID);
                            String newGraduatedUser = "INSERT INTO [User-Graduated]([User-ID],[Graduated-ID]) VALUES ("+Main.LOGGED_USER_ID+","+id+")";
                            System.out.println(newGraduatedUser);
                            statement.execute(newGraduatedUser);


                        } catch (SQLException throwables) {
                            throwables.printStackTrace();
                        }
                    }
                    else if (Type.equals("Employee"))
                    {
                        Calisan calisan = new Calisan(Name,Surname,Age,Mail,Password,Type);
                        calisan.AddUsertoDB();
                        try {

                            String newEmployee ="INSERT INTO Employee(GraduateYear, GradePointAverage, Experience) VALUES (NULL, NULL, NULL)";
                            System.out.println(newEmployee);
                            statement.execute(newEmployee);

                            String getEmployeeID ="SELECT TOP 1 [Employee-ID] FROM [Employee] ORDER BY [Employee-ID] DESC";
                            System.out.println(getEmployeeID);
                            ResultSet resultSet = statement.executeQuery(getEmployeeID);

                            int id = 0;

                            if (resultSet.next())
                            {
                                id = resultSet.getInt(1);
                            }
                            System.out.println(id);
                            System.out.println(Main.LOGGED_USER_ID);
                            String newEmployeeUser = "INSERT INTO [User-Employee]([User-ID],[Employee-ID]) VALUES ("+Main.LOGGED_USER_ID+","+id+")";
                            System.out.println(newEmployeeUser);
                            statement.execute(newEmployeeUser);


                        } catch (SQLException throwables) {
                            throwables.printStackTrace();
                        }
                    }
                    else if (Type.equals("Unemployed"))
                    {
                        Calismayan calismayan = new Calismayan(Name,Surname,Age,Mail,Password,Type);
                        calismayan.AddUsertoDB();

                        try {

                            String newUnemployed ="INSERT INTO Unemployed(GraduateYear, GradePointAverage) VALUES (NULL, NULL)";
                            System.out.println(newUnemployed);
                            statement.execute(newUnemployed);

                            String getUnemployedID ="SELECT TOP 1 [Unemployed-ID] FROM [Unemployed] ORDER BY [Unemployed-ID] DESC";
                            System.out.println(getUnemployedID);
                            ResultSet resultSet = statement.executeQuery(getUnemployedID);

                            int id = 0;

                            if (resultSet.next())
                            {
                                id = resultSet.getInt(1);
                            }
                            System.out.println(id);
                            System.out.println(Main.LOGGED_USER_ID);
                            String newUnemployedUser = "INSERT INTO [User-Unemployed]([User-ID],[Unemployed-ID]) VALUES ("+Main.LOGGED_USER_ID+","+id+")";
                            System.out.println(newUnemployedUser);
                            statement.execute(newUnemployedUser);


                        } catch (SQLException throwables) {
                            throwables.printStackTrace();
                        }

                    }
                    else if (Type.equals("LookingForEmployee"))
                    {
                        IsciArayan isciArayan = new IsciArayan(Name,Surname,Age,Mail,Password,Type);
                        isciArayan.AddUsertoDB();
                        try {

                            String newLookingForEmployee ="INSERT INTO LookingForEmployee(GraduateYear, GradePointAverage, Experience) VALUES (NULL, NULL, NULL)";
                            System.out.println(newLookingForEmployee);
                            statement.execute(newLookingForEmployee);

                            String getLookingForEmployeeID ="SELECT TOP 1 [LookingForEmployee-ID] FROM [LookingForEmployee] ORDER BY [LookingForEmployee-ID] DESC";
                            System.out.println(getLookingForEmployeeID);
                            ResultSet resultSet = statement.executeQuery(getLookingForEmployeeID);

                            int id = 0;

                            if (resultSet.next())
                            {
                                id = resultSet.getInt(1);
                            }
                            System.out.println(id);
                            System.out.println(Main.LOGGED_USER_ID);
                            String newLookingForEmployeeUser = "INSERT INTO [User-LookingForEmployee]([User-ID],[LookingForEmployee-ID]) VALUES ("+Main.LOGGED_USER_ID+","+id+")";
                            System.out.println(newLookingForEmployeeUser);
                            statement.execute(newLookingForEmployeeUser);


                        } catch (SQLException throwables) {
                            throwables.printStackTrace();
                        }
                    }
                    else if (Type.equals("LookingForJob"))
                    {
                        IsArayan isArayan = new IsArayan(Name,Surname,Age,Mail,Password,Type);
                        isArayan.AddUsertoDB();
                        try {

                            String newLookingForJob ="INSERT INTO LookingForJob(GraduateYear, GradePointAverage, Experience) VALUES (NULL, NULL, NULL)";
                            System.out.println(newLookingForJob);
                            statement.execute(newLookingForJob);

                            String getLookingForJobID ="SELECT TOP 1 [LookingForJob-ID] FROM [LookingForJob] ORDER BY [LookingForJob-ID] DESC";
                            System.out.println(getLookingForJobID);
                            ResultSet resultSet = statement.executeQuery(getLookingForJobID);

                            int id = 0;

                            if (resultSet.next())
                            {
                                id = resultSet.getInt(1);
                            }
                            System.out.println(id);
                            System.out.println(Main.LOGGED_USER_ID);
                            String newLookingForJobUser = "INSERT INTO [User-LookingForJob]([User-ID],[LookingForJob-ID]) VALUES ("+Main.LOGGED_USER_ID+","+id+")";
                            System.out.println(newLookingForJobUser);
                            statement.execute(newLookingForJobUser);


                        } catch (SQLException throwables) {
                            throwables.printStackTrace();
                        }
                    }
                }
                catch(NullPointerException ex)
                {

                    Alert alert = new Alert(Alert.AlertType.WARNING);
                    //Setting the title
                    alert.setTitle("Alert");
                    ButtonType type = new ButtonType("Ok", ButtonBar.ButtonData.OK_DONE);
                    //Setting the content of the dialog
                    alert.setContentText("Your definition of you is not checked!");
                    //Adding buttons to the dialog pane
                    alert.getDialogPane().getButtonTypes().add(type);
                    //Setting the label
                    alert.showAndWait();
                }





            }
        });

    }
    //clearing sign in textfields and combobox in below method
    private void ClearSignIn()
    {
        NameSignIn.clear();
        SurnameSignIn.clear();
        AgeSignIn.clear();
        MailSignIn.clear();
        CPasswordSignIn.clear();
        PasswordSignIn.clear();
        TypeSignIn.getItems().clear();
    }

    //taking login type
    private String LogInType()
    {
        String type = null;
        int count = 1;
        String LogInTypeQuery = "SELECT [User],[Student],[Graduated],[Employee],[Unemployed],[LookingForJob],[LookingForEmployee]" +
                " FROM [User] WHERE [User-ID] = "+Main.LOGGED_USER_ID ;
        try {
            ResultSet resultSet = statement.executeQuery(LogInTypeQuery);
            if (resultSet.next())
            {
                Boolean user = resultSet.getBoolean(1);
                Boolean student = resultSet.getBoolean(2);
                Boolean graduated = resultSet.getBoolean(3);
                Boolean employee = resultSet.getBoolean(4);
                Boolean unemployed = resultSet.getBoolean(5);
                Boolean lookingForJob = resultSet.getBoolean(6);
                Boolean lookingForEmployee = resultSet.getBoolean(7);
                if (user == true)
                {
                    type = "User";
                }
                else if (student == true)
                {
                    type = "Student";
                }
                else if (graduated == true)
                {
                    type = "Graduated";
                }
                else if (employee == true)
                {
                    type = "Employee";
                }
                else if (unemployed == true)
                {
                    type = "Unemployed";
                }
                else if (lookingForEmployee == true)
                {
                    type = "LookingForEmployee";
                }
                else if (lookingForJob == true)
                {
                    type = "LookingForJob";
                }
            }
            System.out.println(type);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return type;
    }



}
