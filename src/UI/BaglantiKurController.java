package UI;

import DatabaseConnection.DB_Config;
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
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

public class BaglantiKurController implements Initializable {

    //setting connection
    Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName ="+DB_Config.DatabaseName, DB_Config.UserName, DB_Config.Password);
    Statement statement = conn.createStatement();

    //declaring fxml variables
    @FXML
    private Button SearchUserBtn;
    @FXML
    private Button MakeConnectionBtn;
    @FXML
    private TextField SearchUserTextF;
    @FXML
    private ComboBox MakeConnectionComboBox ;

    //default constructor
    public BaglantiKurController() throws SQLException {
    }


    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {



        SearchUserBtn.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {
                //clearing make connection combobox
                MakeConnectionComboBox.getItems().clear();

                //getting user search text
                String UserText = SearchUserTextF.getText().trim();

                //an arraylist to store user ids
                List<Integer> userids = new ArrayList<Integer>();

                //selecting user ids that its names close to real users' names
                String GetMatchedIDs = "SELECT [User-ID] FROM [User] WHERE [Name] + ' ' + [Surname] LIKE '%"+UserText+"%'";
                System.out.println(GetMatchedIDs);
                try {
                    ResultSet idrs = statement.executeQuery(GetMatchedIDs);
                    while(idrs.next())
                    {
                        userids.add(idrs.getInt(1));
                    }
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                //preparing arraylist for query
                String UserID = "(";
                for(int i = 0; i<userids.size();i++)
                {
                    if(i != userids.size()-1)
                    {
                        UserID = UserID+userids.get(i)+",";
                    }
                    else
                    {
                        UserID = UserID+userids.get(i)+")";
                    }

                }
                //an arraylist to store connections name and surnames
                ArrayList<String> conns = new ArrayList<String>();
                //query for finding above query
                String GetNamesAndSurnames = "SELECT [Name] + ' ' + [Surname] FROM [User] WHERE [User-ID] in "+UserID;
                if (UserID != "(")
                {
                    try
                    {
                        ResultSet rs = statement.executeQuery(GetNamesAndSurnames);
                        while (rs.next())
                        {
                            conns.add(rs.getString(1));
                        }
                        rs.close();
                    } catch (SQLException throwables) {
                        throwables.printStackTrace();
                    }
                    //adding found connections to combobox and selecting it
                    MakeConnectionComboBox.getItems().addAll(conns);
                    MakeConnectionComboBox.getSelectionModel().select(0);
                }
                //if there are no user found, alert displays
                else
                {

                    Alert alert = new Alert(Alert.AlertType.WARNING);
                    //Setting the title
                    alert.setTitle("Alert");
                    ButtonType type = new ButtonType("Ok", ButtonBar.ButtonData.OK_DONE);
                    //Setting the content of the dialog
                    alert.setContentText("Person cannot found!");
                    //Adding buttons to the dialog pane
                    alert.getDialogPane().getButtonTypes().add(type);
                    //Setting the label
                    alert.showAndWait();
                }



            }
        });
        MakeConnectionBtn.setOnMouseClicked(new EventHandler<MouseEvent>() {
            @Override
            public void handle(MouseEvent mouseEvent) {

                //taking combobox value
                String ConnectionNameSurname = (String) MakeConnectionComboBox.getValue();
                //inserting connection to database
                String InsertConnection = "INSERT INTO Connections([User1-ID], [User2-ID]) VALUES("+Main.LOGGED_USER_ID+",(SELECT [User-ID] FROM [User] WHERE [Name] + ' ' + [Surname] = '"+ConnectionNameSurname+"'))";
                System.out.println(InsertConnection);
                //an alert to display that process is successful
                try {
                    statement.execute(InsertConnection);
                    Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
                    //Setting the title
                    alert.setTitle("Alert");
                    ButtonType type = new ButtonType("Ok", ButtonBar.ButtonData.OK_DONE);
                    //Setting the content of the dialog
                    alert.setContentText("Connection is successfull.");
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

    //a method to send user to main page
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
