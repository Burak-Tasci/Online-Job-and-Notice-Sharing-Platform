package Classes;

public class IsArayan extends Calismayan {

    private int tecrube;

    //first constructor
    public IsArayan()
    {
        //calling parent class
        super();
        System.out.println("The person that has created is searching job now.");
    }

    //second constructor
    public IsArayan(int tecrube)
    {
        //calling default constructor
        this();
        this.tecrube = tecrube;
    }
    //third constructor
    public IsArayan(String Ad, String Soyad,int Yas, String Mail, String Sifre, String Type)
    {
        //calling parent class
        super(Ad, Soyad, Yas, Mail, Sifre, Type);
    }

    //getter setter
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
