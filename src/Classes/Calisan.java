package Classes;

public class Calisan extends Mezun {

    private int tecrube;

    //here is first constructor
    public Calisan()
    {
        super();
        System.out.println("The person that has created is working now.");
    }
    //second one with experience variable
    public Calisan(int tecrube)
    {
        this();
        this.tecrube = tecrube;
    }

    //super method for passing values
    public Calisan(String Ad, String Soyad,int Yas, String Mail, String Sifre, String Type)
    {
        super(Ad, Soyad, Yas, Mail, Sifre, Type);
    }

    //getter and setter
    public int getTecrube() {
        return tecrube;
    }

    public void setTecrube(int tecrube) {
        this.tecrube = tecrube;
    }

    @Override
    public String toString() {
        return super.toString()+"\n"+
                "Tecrübe = "+this.getTecrube();
    }
}
