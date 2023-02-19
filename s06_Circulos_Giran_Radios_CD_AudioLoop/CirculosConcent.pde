public class CirculosConcent{

    Random generator;
    ArrayList<Circulos> listaCirculos = new ArrayList<Circulos>();
    
    int des=0;
    float angulo=0;
    Circulos origen;
    float VELOCIDAD_INTERIOR=5;
    float LIM_INF_RAD=0.3;
    float LIM_SUP_RAD=1;
    float RADIO_TOTAL;
    


    public CirculosConcent(Circulos c, int numCir){
            origen=c;
            origen.angulo=radians(random(0,360));
            RADIO_TOTAL=c.posX+c.radio;
            
            for (int i = 0; i < numCir; ++i) {
                int diametroNuevo=(int)((c.radio/2)*constrain(random(0,1), 0.01, 1));
               
                Circulos c1=new Circulos(0,0,diametroNuevo,radians(random(0,VELOCIDAD_INTERIOR)));
                
                calculaCentro(c1,0);
                listaCirculos.add(c1);
            }
            
        }

   

    void calculaCentro(Circulos c, int angulo){
        int puntoXext=0;
        int puntoYext=0;

        puntoXext=(int)(0+origen.radio*cos(radians(angulo)));
        

        
        c.posX=puntoXext-c.radio;
        c.posY=puntoYext; //la CoordendaY la ponemos siempre en el 0
        c.angulo=radians(random(0, 360));
    }

    void calculaCentroRuido(Circulos c){
        int puntoXext=0;
        int puntoYext=0;

        puntoXext=(int)(0+(origen.diametro/2)*cos(radians(angulo)));
        

        
        c.posX=puntoXext-c.radio;
        c.posY=puntoYext; //la CoordendaY la ponemos siempre en el 0
        //c.angulo=radians(random(0, 360));
    }
}
