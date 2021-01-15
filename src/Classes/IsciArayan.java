package Classes;

public class IsciArayan extends Calisan{

    //constructor
    public IsciArayan()
    {
        System.out.println("The person that has created is searching employee now.");
    }

    //constructor
    public IsciArayan(String Ad, String Soyad,int Yas, String Mail, String Sifre, String Type)
    {
        //super method for passing values
        super(Ad, Soyad, Yas, Mail, Sifre, Type);
    }

    @Override
    public String toString() {
        return super.toString();
    }
}
