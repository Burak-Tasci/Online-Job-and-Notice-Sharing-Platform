package Classes;

public class Mezun extends Ogrenci {

    private double gano ;

    //constructor
    public Mezun()
    {
        super();
        System.out.println("Graduated person has created.");
    }
    //constructor
    public Mezun(double gano)
    {
        this();
        this.gano = gano;
    }
    //constructor
    public Mezun(String Ad, String Soyad,int Yas, String Mail, String Sifre, String Type)
    {
        //super method for passing values
        super(Ad, Soyad, Yas, Mail, Sifre, Type);
    }

    //getter setter
    public double getGano() {
        return gano;
    }

    public void setGano(double gano) {
        this.gano = gano;
    }

    @Override
    public String toString() {
        return super.toString()+"\n"+
                "Gano = "+this.getGano();

    }
}
