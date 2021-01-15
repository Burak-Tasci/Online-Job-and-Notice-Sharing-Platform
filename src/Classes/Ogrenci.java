package Classes;

public class Ogrenci extends User {

    private String MezunOlunacakTarih = null ;

    //constructor
    public Ogrenci()
    {
        super();
        System.out.println("Student has been added.");
    }
    //constructor
    public Ogrenci(String MezunOlunacakTarih)
    {

        this();  //calling default constructor
        this.MezunOlunacakTarih = MezunOlunacakTarih;

    }
    //constructor
    public Ogrenci(String Ad, String Soyad,int Yas, String Mail, String Sifre, String Type)
    {
        //super method for passing values
        super(Ad, Soyad, Yas, Mail, Sifre, Type);
    }

    //getter setter
    public String getMezunOlunacakTarih() {
        return MezunOlunacakTarih;
    }

    public void setMezunOlunacakTarih(String mezunOlunacakTarih) {
        MezunOlunacakTarih = mezunOlunacakTarih;
    }

    @Override
    public String toString() {
        return super.toString()+"\n"+
                "Mezun Olma Tarihi = "+this.getMezunOlunacakTarih();
    }


}
