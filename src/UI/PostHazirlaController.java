package UI;

import DatabaseConnection.DB_Config;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.input.MouseEvent;

import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ResourceBundle;

import static UI.AnaSayfaController.CapitalizeFirsts;


public class PostHazirlaController implements Initializable {

    //connection setting
    Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName ="+DB_Config.DatabaseName, DB_Config.UserName, DB_Config.Password);
    Statement statement = conn.createStatement();

    //fxml variables
    @FXML
    private Button SubmitBtn;
    @FXML
    private TextArea Text;

    //constructor
    public PostHazirlaController() throws SQLException {
    }

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

        //getting posts from database
        try {
            GetPosts();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        SubmitBtn.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {

                //taking post and giving alert display
                try {
                    CreateAndStorePost(Text.getText().trim(),Main.LOGGED_USER_ID,true);
                    Text.setText("");
                    Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
                    //Setting the title
                    alert.setTitle("Alert");
                    ButtonType type = new ButtonType("Ok", ButtonBar.ButtonData.OK_DONE);
                    //Setting the content of the dialog
                    alert.setContentText("Post has been sent.");
                    //Adding buttons to the dialog pane
                    alert.getDialogPane().getButtonTypes().add(type);
                    //Setting the label
                    alert.showAndWait();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }





            }
        });

    }

    //method to send user main page
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
    public void GetPosts() throws SQLException {
        //getting posts ordered by date
        String GetPosts = "SELECT [User-ID],[Text] FROM [Posts] ORDER BY [date] DESC";
        String txt = null;
        int id = 0;
        ResultSet rs = statement.executeQuery(GetPosts);
        while(rs.next())
        {
            txt = rs.getString("Text");
            id = rs.getInt(1);
            CreateAndStorePost(txt,id,false);
        }

    }

    //this method takes database data and converts it to a post
    public void CreateAndStorePost(String text, int id,boolean who) throws SQLException {
        //who variable determines who sent post (me or someone), true = me

        //taking name and surname query
        String NameAndSurnameQuery = "SELECT [Name] + ' ' + [Surname] as NS FROM [User] WHERE [User-ID] = " + id;

            //
            try {
                Statement statement1 = conn.createStatement();
                ResultSet r = statement1.executeQuery(NameAndSurnameQuery);
                if (r.next())
                {
                    //if its  me, we are adding name to text
                    if (who == true)
                        text = "•"+CapitalizeFirsts(r.getString("NS"))+ "•\n   " + text;

                }

                //configuring text and adding it to posttexts
                text += "\n";
                System.out.println(text);
                Main.PostTexts.add(text);

                //if its me it adds post to database
                if(who == true)
                {
                    String pattern = "yyyy-MM-dd hh:mm:ss";
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
                    String str = simpleDateFormat.format(new Date());

                    String InsertPostToSQL = "INSERT INTO Posts([User-ID],[Text],[date]) VALUES("+Main.LOGGED_USER_ID+",'"+text+"','"+str+"')";
                    System.out.println(InsertPostToSQL);
                    statement.execute(InsertPostToSQL);
                }

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }


    }

}
