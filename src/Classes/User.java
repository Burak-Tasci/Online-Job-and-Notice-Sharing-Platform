package Classes;

import DatabaseConnection.DB_Config;
import UI.Main;
import com.microsoft.sqlserver.jdbc.SQLServerException;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import javafx.scene.control.Alert;
import javafx.scene.control.ButtonBar;
import javafx.scene.control.ButtonType;

import javax.management.Query;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.sql.*;

public class User extends Object {

    //feature variables
    private String Ad;
    private String Soyad;
    private int Yas = 0;
    private String Mail;
    private String Sifre;
    private String Type;

    private Date date = new Date();
    private String KayitTarihi;

    //constructor
    public User(String Ad, String Soyad,int Yas, String Mail, String Sifre, String Type)
    {
        this();
        this.Ad = Ad;
        this.Soyad = Soyad;
        this.Yas = Yas;
        this.Mail = Mail;
        this.Sifre = Sifre;
        this.Type = Type;
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        this.KayitTarihi = simpleDateFormat.format(this.date);


    }

    //default constructor
    public User() {

    }


    @Override
    public String toString() {
        return "User:" +
                "\nAd='" + Ad + '\'' +
                "\nSoyad='" + Soyad + '\'' +
                "\nYas='" + Yas + '\'' +
                "\nMail='" + Mail + '\'' +
                "\nSifre='" + Sifre + '\'' +
                "\nKayitTarihi=" + KayitTarihi
                ;
    }

    //method for adding user to database
    public void AddUsertoDB()
    {

        try {
            //connection definiton
            Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName ="+ DB_Config.DatabaseName, DB_Config.UserName, DB_Config.Password);
            Statement statement = conn.createStatement();

            if (this.Ad != "" && this.Soyad != "" && this.Yas != 0 && this.Mail != "" && this.Type != null)
            {

                //user insert query
                String query = "INSERT INTO [User] (Name,Surname,Age,Mail,Password,SigninDate,["+this.Type+"]) VALUES ('"+this.Ad+"','"+
                        this.Soyad+"',"+this.Yas+",'"+this.Mail+"','"+this.Sifre+"','"+this.KayitTarihi+"',"+1+")";


                System.out.println(query);

                statement.execute(query);

                //getting user id
                String getUserID ="SELECT TOP 1 [User-ID] FROM [User] ORDER BY [User-ID] DESC";
                System.out.println(getUserID);
                ResultSet resultSet = statement.executeQuery(getUserID);

                //setting logged user id
                if (resultSet.next())
                {
                    Main.LOGGED_USER_ID = resultSet.getInt(1);
                }



            }
            else
            {

                //if there is a empty input

                Alert alert = new Alert(Alert.AlertType.WARNING);
                //Setting the title
                alert.setTitle("Alert");
                ButtonType type = new ButtonType("Ok", ButtonBar.ButtonData.OK_DONE);
                //Setting the content of the dialog
                alert.setContentText("Sign in is not successfull.");
                //Adding buttons to the dialog pane
                alert.getDialogPane().getButtonTypes().add(type);
                //Setting the label
                alert.showAndWait();
            }

            //Education Connection







        }
        catch (SQLServerException e)
        {
            System.out.println(e);
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
