public class CirculosConcent{

    Random generator;
    ArrayList<Circulos> listaCirculos = new ArrayList<Circulos>();
    
    int des=0;
    float angulo=0;
    Circulos origen;
    float INCREMENTO_AN=0.03;

    public CirculosConcent(Circulos c){
        origen=c;
        int diametroNuevo=c.radio/2;
        // println("radioNuevo:"+diametroNuevo,"desplazamiento"+des);
        
        Circulos c1=new Circulos(0,0,diametroNuevo);
        calculaCentro(c1,0);
        
        listaCirculos.add(c1);
    }


public CirculosConcent(Circulos c, int numCir){
        origen=c;
        
        // println("radioNuevo:"+diametroNuevo,"desplazamiento"+des);
        
        for (int i = 0; i < numCir; ++i) {
            int diametroNuevo=(int)((c.radio/2)*constrain(random(0,1), 0.3, 1));
            Circulos c1=new Circulos(0,0,diametroNuevo,"A"+i);
            calculaCentro(c1,0);
            listaCirculos.add(c1);
        }
        
    }


    void display(){
        background(0);
        pushMatrix();
        noFill();
        ellipseMode(CENTER);
        translate(origen.posX, origen.posY);
        ellipse(0,0,origen.diametro,origen.diametro);
        for (Circulos o : listaCirculos) { 
          pushMatrix();
            rotate(o.angulo);
            ellipse(o.posX, o.posY, o.diametro, o.diametro);
            //o.angulo+=INCREMENTO_AN;
            if(INCREMENTO_AN<1){
             INCREMENTO_AN+=INCREMENTO_AN;
            }
            o.angulo+=radians(INCREMENTO_AN);
            println(o.nom,o.angulo,radians(INCREMENTO_AN));
          popMatrix();
        }
        popMatrix();
        
    }



    void calculaCentro(Circulos c, int angulo){
        int puntoXext=0;
        int puntoYext=0;

        puntoXext=(int)(0+origen.radio*cos(radians(angulo)));
        // puntoYext=(int)(0+origen.radio*sin(radians(angulo)));

        println(puntoXext,puntoYext);
        c.posX=puntoXext-c.radio;
        c.posY=puntoYext;
        c.angulo=radians(random(0, 360));
    }
}
