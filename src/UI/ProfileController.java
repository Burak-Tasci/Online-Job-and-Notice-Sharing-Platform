package UI;

import DatabaseConnection.DB_Config;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.BorderPane;

import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.util.ArrayList;
import java.util.ResourceBundle;

public class ProfileController implements Initializable {

    //fxml variables
    @FXML
    public TextField NameText;

    @FXML
    public TextField SurnameText;

    @FXML
    public TextField AgeText;

    @FXML
    public TextField MailText;

    @FXML
    public TextField SignUpDateText;

    @FXML
    public ComboBox EducationCBox;

    @FXML
    public ComboBox CertificatesCBox;

    @FXML
    public ComboBox LanguagesCBox;

    @FXML
    public Button EditBtn;

    @FXML
    public TextField GraduateYearText;

    @FXML
    public TextField GPAText;

    @FXML
    public TextField ExperienceText;

    public ProfileController() throws SQLException {
    }
    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

        InsertValues();
        EditBtn.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {


                if (Main.ACCOUNT_TYPE == "User")
                {
                    try {
                        Main.root = FXMLLoader.load(getClass().getResource("UserEditPage.fxml"));
                        Main.stage.setScene(new Scene(Main.root, 420, 520));
                        Main.stage.show();
                    }
                    catch (IOException e)
                    {
                        e.printStackTrace();
                    }
                }

                else if (Main.ACCOUNT_TYPE == "Student")
                {
                    try {
                        Main.root = FXMLLoader.load(getClass().getResource("StudentEditPage.fxml"));
                        Main.stage.setScene(new Scene(Main.root, 420, 520));
                        Main.stage.show();
                    }
                    catch (IOException e)
                    {
                        e.printStackTrace();
                    }
                }
                else if (Main.ACCOUNT_TYPE == "Graduated")
                {
                    try {
                        Main.root = FXMLLoader.load(getClass().getResource("GraduatedEditPage.fxml"));
                        Main.stage.setScene(new Scene(Main.root, 420, 520));
                        Main.stage.show();
                    }
                    catch (IOException e)
                    {
                        e.printStackTrace();
                    }
                }
                else if (Main.ACCOUNT_TYPE == "Employee")
                {
                    try {
                        Main.root = FXMLLoader.load(getClass().getResource("EmployeeEditPage.fxml"));
                        Main.stage.setScene(new Scene(Main.root, 420, 520));
                        Main.stage.show();
                    }
                    catch (IOException e)
                    {
                        e.printStackTrace();
                    }
                }
                else if (Main.ACCOUNT_TYPE == "Unemployed")
                {
                    try {
                        Main.root = FXMLLoader.load(getClass().getResource("GraduatedEditPage.fxml"));
                        Main.stage.setScene(new Scene(Main.root, 420, 520));
                        Main.stage.show();
                    }
                    catch (IOException e)
                    {
                        e.printStackTrace();
                    }
                }
                else if (Main.ACCOUNT_TYPE == "LookingForJob")
                {
                    try {
                        Main.root = FXMLLoader.load(getClass().getResource("EmployeeEditPage.fxml"));
                        Main.stage.setScene(new Scene(Main.root, 420, 520));
                        Main.stage.show();
                    }
                    catch (IOException e)
                    {
                        e.printStackTrace();
                    }
                }
                else if (Main.ACCOUNT_TYPE == "LookingForEmployee")
                {
                    try {
                        Main.root = FXMLLoader.load(getClass().getResource("EmployeeEditPage.fxml"));
                        Main.stage.setScene(new Scene(Main.root, 420, 520));
                        Main.stage.show();
                    }
                    catch (IOException e)
                    {
                        e.printStackTrace();
                    }
                }



            }
        });

    }

    //taking values from main and inserting them to profile
    public void InsertValues()
    {
        if (Main.Name != null)
            NameText.setText(Main.Name);
        if (Main.Surname != null)
            SurnameText.setText(Main.Surname);
        if (Main.Age != 0)
            AgeText.setText(String.valueOf(Main.Age));
        if (Main.Mail != null)
            MailText.setText(Main.Mail);
        if (Main.date != null)
            SignUpDateText.setText(String.valueOf(Main.date));
        if (Main.Primary != null)
        {
            EducationCBox.getItems().add(Main.Primary);
            EducationCBox.getSelectionModel().select(0);
        }
        if (Main.Secondry != null)
            EducationCBox.getItems().add(Main.Secondry);
        if (Main.HighSchool != null)
            EducationCBox.getItems().add(Main.HighSchool);
        if (Main.University != null)
            EducationCBox.getItems().add(Main.University);
        if (Main.Extra != null)
            EducationCBox.getItems().add(Main.Extra);
        if (Main.Certificates != null)
        {
            CertificatesCBox.getItems().addAll(Main.Certificates);
            CertificatesCBox.getSelectionModel().select(0);
        }
        if (Main.Languages != null)
        {
            LanguagesCBox.getItems().addAll(Main.Languages);
            LanguagesCBox.getSelectionModel().select(0);
        }
        if (Main.GraduateYear != null)
        {
            GraduateYearText.setText(String.valueOf(Main.GraduateYear));
        }
        if (Main.GradePointAverage != 0.0)
        {
            GPAText.setText(String.valueOf(Main.GradePointAverage));
        }
        if (Main.Experience != 0)
        {
            ExperienceText.setText(String.valueOf(Main.Experience));
        }

    }
    //directing user to mainpage method
    public void ToMainPage()
    {
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
}
