public class Circulos {

    int diametro=0, radio=0;
    int posX=0, posY=0;
    float angulo=0;
    String nom;

 public Circulos (int x, int y, int d) {
        posX=x;
        posY=y;
        radio=d;
        diametro=d*2;
        
    }

    public Circulos (int x, int y, int d,String nombre) {
        posX=x;
        posY=y;
        radio=d;
        diametro=d*2;
        nom=nombre;
    }

    public Circulos (int x, int y, int d, float an) {
        posX=x;
        posY=y;
        radio=d;
        diametro=d*2;    
        angulo=an;   
    }

    void display(){
        pushMatrix();
        translate(posX, posY);
        noFill();
        ellipseMode(CENTER);
        ellipse(0, 0, diametro, diametro);
        popMatrix();
    }

}
