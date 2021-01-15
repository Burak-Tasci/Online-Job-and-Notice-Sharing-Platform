package Classes;

public class Calismayan extends Mezun {

    //first constructor
    public Calismayan()
    {
        System.out.println("The person that has created is not working now.");
    }

    //second constructor
    public Calismayan(String Ad, String Soyad,int Yas, String Mail, String Sifre, String Type)
    {
        //super method for passing values
        super(Ad, Soyad, Yas, Mail, Sifre, Type);
    }

    @Override
    public String toString() {
        return super.toString();
    }
}
