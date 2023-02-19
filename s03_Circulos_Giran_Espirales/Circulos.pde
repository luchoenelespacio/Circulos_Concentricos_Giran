public class Circulos {

    float diametro=0, radio=0;
    float posX=0, posY=0;
    float angulo=0;
    String nom;
    float vel;

 public Circulos (float x, float y, float d, float v) {
        posX=x;
        posY=y;
        radio=d;
        diametro=d*2;
        vel=v;
    }

    public Circulos (float x, float y, float d,String nombre) {
        posX=x;
        posY=y;
        radio=d;
        diametro=d*2;
        nom=nombre;
    }

    public Circulos (float x, float y, int d, float an) {
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
