/* autogenerated by Processing revision 1286 on 2022-10-15 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.Random;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class s03_Circulos_Giran_Espirales extends PApplet {



Circulos cir;
CirculosConcent miCirculoOrigen, miCirculoOrigenlinea2;
int NUM_CIRCULOS_INTERIORES=0;
int NUM_CIRCULOS_CONCENT=7;
float INCREMENTO_AN=0.01f;
float centroX=width/2;
float centroY=height/2;

float RADIO_ACUMULADO=0;
float VELOCIDAD=random(0,0.5f);


ArrayList<CirculosConcent> listaC = new ArrayList<CirculosConcent>();


 public void setup() {
  
    float radioOriginal=100;
    frameRate(30);
    /* size commented out by preprocessor */;
    centroX=width/2;
    centroY=height/2;
    background(0);
    stroke(250);
    //cir=new Circulos(width/2, height/2, 100);
    miCirculoOrigen=new CirculosConcent(new Circulos(centroX, centroY, radioOriginal,0),NUM_CIRCULOS_INTERIORES);
    listaC.add(miCirculoOrigen);
    RADIO_ACUMULADO+=radioOriginal;
    
    for(int i=0;i<NUM_CIRCULOS_CONCENT;i++){
       float radioAleatorio=random(radioOriginal/2,radioOriginal);
      
       miCirculoOrigenlinea2=new CirculosConcent(new Circulos(RADIO_ACUMULADO+radioAleatorio, 0.0f, radioAleatorio,radians((VELOCIDAD/(VELOCIDAD+i)))),NUM_CIRCULOS_INTERIORES);
       listaC.add(miCirculoOrigenlinea2);
        RADIO_ACUMULADO+=radioAleatorio*2;
        // println("Radio_Acumulado:"+RADIO_ACUMULADO);
        
    }
    
    
}

 public void draw() {
    // cir.display();
    // background(0);
    // noLoop();
    
    //delay(100);



    
        background(0);
        //pushMatrix();
        //noFill();
        //ellipseMode(CENTER);
        //translate(miCirculoOrigen.origen.posX, miCirculoOrigen.origen.posY);
        
        //ellipse(0,0,miCirculoOrigen.origen.diametro,miCirculoOrigen.origen.diametro);
        //for (Circulos o : miCirculoOrigen.listaCirculos) { 
        //    rotate(o.angulo);
        //    ellipse(o.posX, o.posY, o.diametro, o.diametro);
        //    o.angulo+=INCREMENTO_AN;
        //    // println(o.nom,o.angulo);
        //}
        //popMatrix();

        pushMatrix();
        noFill();
        ellipseMode(CENTER);
        translate(listaC.get(0).origen.posX, listaC.get(0).origen.posY);
        //println(listaC.get(0).origen.posX, listaC.get(0).origen.posY);
        ellipse(0,0,listaC.get(0).origen.diametro,listaC.get(0).origen.diametro);
      
        
        for(int i=1;i<listaC.size();i++){
            rotate(listaC.get(i).origen.angulo);
            
            ellipse(listaC.get(i).origen.posX,listaC.get(i).origen.posY,listaC.get(i).origen.diametro,listaC.get(i).origen.diametro);
            
            //ellipse(c.origen.posX, c.origen.posY, c.origen.diametro, c.origen.diametro);
           println(listaC.get(i).origen.posX, listaC.get(i).origen.posY);
            listaC.get(i).origen.angulo+=listaC.get(i).origen.vel;
            // listaC.get(i).origen.angulo+=INCREMENTO_AN;
            
        }
        
         popMatrix();   

        //pushMatrix();
        //ellipseMode(CENTER);
        //translate(miCirculoOrigenlinea2.origen.posX, miCirculoOrigenlinea2.origen.posY);
        ////ellipse(miCirculoOrigenlinea2.origen.posX,miCirculoOrigenlinea2.origen.posY,miCirculoOrigenlinea2.origen.diametro,miCirculoOrigenlinea2.origen.diametro);
        //for (Circulos o : miCirculoOrigenlinea2.listaCirculos) { 
        //    rotate(o.angulo);
        //    ellipse(o.posX, o.posY, o.diametro, o.diametro);
        //    o.angulo+=INCREMENTO_AN;
        //    // println(o.nom,o.angulo);
        //}
        //popMatrix();
        //popMatrix();
        
    
}
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

     public void display(){
        pushMatrix();
        translate(posX, posY);
        noFill();
        ellipseMode(CENTER);
        ellipse(0, 0, diametro, diametro);
        popMatrix();
    }

}
public class CirculosConcent{

    Random generator;
    ArrayList<Circulos> listaCirculos = new ArrayList<Circulos>();
    
    int des=0;
    float angulo=0;
    Circulos origen;
    float INCREMENTO_ANG=0;
    float LIM_INF_RAD=0.3f;
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
                int diametroNuevo=(int)((c.radio/2)*constrain(random(0,1), 0.3f, 1));
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


     public void calculaCentro(Circulos c, int angulo){
        int puntoXext=0;
        int puntoYext=0;

        puntoXext=(int)(0+origen.radio*cos(radians(angulo)));
        

        println(puntoXext,puntoYext);
        c.posX=puntoXext-c.radio;
        c.posY=puntoYext; //la CoordendaY la ponemos siempre en el 0
        c.angulo=radians(random(0, 360));
    }
}


  public void settings() { size(1920, 1080); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "s03_Circulos_Giran_Espirales" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}