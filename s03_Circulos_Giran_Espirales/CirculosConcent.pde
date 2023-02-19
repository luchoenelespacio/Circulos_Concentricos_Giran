public class CirculosConcent{

    Random generator;
    ArrayList<Circulos> listaCirculos = new ArrayList<Circulos>();
    
    int des=0;
    float angulo=0;
    Circulos origen;
    float INCREMENTO_ANG=0;
    float LIM_INF_RAD=0.3;
    float LIM_SUP_RAD=1;
    
    //public CirculosConcent(Circulos c){
    //    origen=c;
    //    int diametroNuevo=c.radio/2;
    //    // println("radioNuevo:"+diametroNuevo,"desplazamiento"+des);
        
    //    Circulos c1=new Circulos(0,0,diametroNuevo);
    //    calculaCentro(c1,0);
        
    //    listaCirculos.add(c1);
    //}


    public CirculosConcent(Circulos c, int numCir){
            origen=c;
            origen.angulo=radians(random(0,360));
            
            for (int i = 0; i < numCir; ++i) {
                int diametroNuevo=(int)((c.radio/2)*constrain(random(0,1), 0.3, 1));
                Circulos c1=new Circulos(0,0,diametroNuevo,"A"+i);
                calculaCentro(c1,0);
                listaCirculos.add(c1);
            }
            
        }

    /* void display(){
        background(0);
        pushMatrix();
        noFill();
        ellipseMode(CENTER);
        translate(origen.posX, origen.posY);
        ellipse(0,0,origen.diametro,origen.diametro);
        for (Circulos o : listaCirculos) { 
            rotate(o.angulo);
            ellipse(o.posX, o.posY, o.diametro, o.diametro);
            o.angulo+=INCREMENTO_AN;
            println(o.nom,o.angulo);
        }
        popMatrix();
        
    } */


    void calculaCentro(Circulos c, int angulo){
        int puntoXext=0;
        int puntoYext=0;

        puntoXext=(int)(0+origen.radio*cos(radians(angulo)));
        

        println(puntoXext,puntoYext);
        c.posX=puntoXext-c.radio;
        c.posY=puntoYext; //la CoordendaY la ponemos siempre en el 0
        c.angulo=radians(random(0, 360));
    }
}
