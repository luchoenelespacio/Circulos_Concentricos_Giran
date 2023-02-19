import java.util.Random;

Circulos cir;
CirculosConcent miCirculoOrigen, miCirculoOrigenlinea2;
int NUM_CIRCULOS_INTERIORES=5;
int NUM_CIRCULOS_CONCENT=7;
float INCREMENTO_AN=0.01;
float centroX=width/2;
float centroY=height/2;

float RADIO_ACUMULADO=0;
boolean sentido = true;

ArrayList<CirculosConcent> listaC = new ArrayList<CirculosConcent>();


void setup() {
  
    float radioOriginal=75;
    frameRate(60);
    size(1080, 1080);
    centroX=width/2;
    centroY=height/2;
    background(0);
    //blendMode(EXCLUSION);
    stroke(250);
    
    miCirculoOrigen=new CirculosConcent(new Circulos(centroX, centroY, radioOriginal,0),NUM_CIRCULOS_INTERIORES);
    listaC.add(miCirculoOrigen);
    RADIO_ACUMULADO+=radioOriginal;
    float VELOCIDAD=180;
    
    for(int i=1;i<NUM_CIRCULOS_CONCENT;i++){
       float radioAleatorio=random(radioOriginal/5,radioOriginal);

       miCirculoOrigenlinea2=new CirculosConcent(new Circulos(RADIO_ACUMULADO+radioAleatorio, 0.0, radioAleatorio,radians(VELOCIDAD/i)),NUM_CIRCULOS_INTERIORES);
              
       listaC.add(miCirculoOrigenlinea2);
        RADIO_ACUMULADO+=radioAleatorio*2;
        
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
        ellipse(0,0,listaC.get(0).origen.diametro,listaC.get(0).origen.diametro);
        
        for (Circulos o : listaC.get(0).listaCirculos) { 
               pushMatrix();
                rotate(o.angulo);
                stroke(#1ECAF7);
                ellipse(o.posX, o.posY, o.diametro, o.diametro);
                o.angulo+=o.vel;
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
            
           
            if(i%2==0){
                if(sentido)
                    listaC.get(i).origen.angulo+=radians(listaC.get(i).origen.vel);
                else
                    listaC.get(i).origen.angulo-=radians(listaC.get(i).origen.vel);
            }else{
                if(sentido)
                    listaC.get(i).origen.angulo-=radians(listaC.get(i).origen.vel);
                else
                    listaC.get(i).origen.angulo+=radians(listaC.get(i).origen.vel);
            }
            
            
           
            pushMatrix();
            ellipseMode(CENTER);
            translate(listaC.get(i).origen.posX, listaC.get(i).origen.posY);
            for (Circulos o : listaC.get(i).listaCirculos) { 
                pushMatrix();
                stroke(#1ECAF7);
                rotate(o.angulo);
                ellipse(o.posX, o.posY, o.diametro, o.diametro);
                o.angulo+=o.vel;
                
                popMatrix();
            }
            popMatrix();
            popMatrix();
        }
        
        popMatrix();   
        
   
}

void keyPressed() {
    if(sentido)
        sentido=false;
    else
        sentido=true;    
}
