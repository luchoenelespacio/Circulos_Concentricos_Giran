import java.util.Random;

Circulos cir;
CirculosConcent miCirculoOrigen, miCirculoOrigenlinea2;
int NUM_CIRCULOS_INTERIORES=7;
int NUM_CIRCULOS_CONCENT=7;
float INCREMENTO_AN=0.01;
float centroX=width/2;
float centroY=height/2;

float RADIO_ACUMULADO=0;


ArrayList<CirculosConcent> listaC = new ArrayList<CirculosConcent>();


void setup() {
  
    float radioOriginal=75;
    frameRate(60);
    size(1920, 1080);
    centroX=width/2;
    centroY=height/2;
    background(0);
    stroke(250);
    //cir=new Circulos(width/2, height/2, 100);
    miCirculoOrigen=new CirculosConcent(new Circulos(centroX, centroY, radioOriginal,0),NUM_CIRCULOS_INTERIORES);
    listaC.add(miCirculoOrigen);
    RADIO_ACUMULADO+=radioOriginal;
    float VELOCIDAD=180;
    
    for(int i=1;i<NUM_CIRCULOS_CONCENT;i++){
       float radioAleatorio=random(radioOriginal/5,radioOriginal);
  
      
       //miCirculoOrigenlinea2=new CirculosConcent(new Circulos(RADIO_ACUMULADO+radioAleatorio, 0.0, radioAleatorio,(1/(VELOCIDAD+i*50))),NUM_CIRCULOS_INTERIORES);
       miCirculoOrigenlinea2=new CirculosConcent(new Circulos(RADIO_ACUMULADO+radioAleatorio, 0.0, radioAleatorio,radians(VELOCIDAD/i)),NUM_CIRCULOS_INTERIORES);
              
       listaC.add(miCirculoOrigenlinea2);
        RADIO_ACUMULADO+=radioAleatorio*2;
        // println("Radio_Acumulado:"+RADIO_ACUMULADO);
        
    }
    
    
}

void draw() {

        background(0);
        smooth();

        pushMatrix();
        stroke(250);
        noFill();
        ellipseMode(CENTER);
        translate(listaC.get(0).origen.posX, listaC.get(0).origen.posY);
        //println(listaC.get(0).origen.posX, listaC.get(0).origen.posY);
        ellipse(0,0,listaC.get(0).origen.diametro,listaC.get(0).origen.diametro);
        
        for (Circulos o : listaC.get(0).listaCirculos) { 
               pushMatrix();
                rotate(o.angulo);
                stroke(#1ECAF7);
                ellipse(o.posX, o.posY, o.diametro, o.diametro);
                o.angulo+=o.vel;
                // println(o.nom,o.angulo);
              popMatrix();
        }
        stroke(250);
        for(int i=1;i<listaC.size();i++){
            ellipse(0,0,listaC.get(i).RADIO_TOTAL*2,listaC.get(i).RADIO_TOTAL*2);
        }      
        
        for(int i=1;i<listaC.size();i++){
            pushMatrix();
            stroke(250);
            rotate(listaC.get(i).origen.angulo);
            
            ellipse(listaC.get(i).origen.posX,listaC.get(i).origen.posY,listaC.get(i).origen.diametro,listaC.get(i).origen.diametro);
            
            //ellipse(c.origen.posX, c.origen.posY, c.origen.diametro, c.origen.diametro);
           //println(listaC.get(i).origen.posX, listaC.get(i).origen.posY);
            // listaC.get(i).origen.angulo+=listaC.get(i).origen.vel;
            if(i%2==0){
              listaC.get(i).origen.angulo+=radians(listaC.get(i).origen.vel);
            }else{
               listaC.get(i).origen.angulo-=radians(listaC.get(i).origen.vel);
            }
            
            //println("velocidad:"+listaC.get(i).origen.vel);
            //println("angulo"+listaC.get(i).origen.angulo);
            // listaC.get(i).origen.angulo+=INCREMENTO_AN;
           
            pushMatrix();
            ellipseMode(CENTER);
            translate(listaC.get(i).origen.posX, listaC.get(i).origen.posY);
            //ellipse(listaC.get(i).origen.posX,listaC.get(i).origen.posY,listaC.get(i).origen.diametro,listaC.get(i).origen.diametro);
            for (Circulos o : listaC.get(i).listaCirculos) { 
                pushMatrix();
                stroke(#1ECAF7);
                rotate(o.angulo);
                ellipse(o.posX, o.posY, o.diametro, o.diametro);
                o.angulo+=o.vel;
                println(o.vel);
                popMatrix();
            }
            popMatrix();
            popMatrix();
        }
        
        popMatrix();   
        //noLoop();
   
}
