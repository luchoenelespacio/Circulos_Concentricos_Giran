import java.util.Random;
import processing.pdf.*;
import java.util.Calendar;
import java.util.Random;
import ddf.minim.analysis.FFT;
import ddf.minim.*;

//Cosas de Audio
Minim minim;
AudioInput input;
FFT fftLog;
AudioPlayer song;
Float frecuenciaActual;


//Var de círculos
Circulos cir;
CirculosConcent miCirculoOrigen, miCirculoOrigenlinea2;
int NUM_CIRCULOS_INTERIORES=5;
int NUM_CIRCULOS_CONCENT=11;
float INCREMENTO_AN=0.01;
float centroX=width/2;
float centroY=height/2;

float RADIO_ACUMULADO=0;
boolean sentido = true;

ArrayList<CirculosConcent> listaC = new ArrayList<CirculosConcent>();

/////////
Random generator;


///////
color COLOR_INNER_CIRCLE= color(191,100,100);
int COLOR_OUTER_CIRCLE=250;
float GROSOR_LINEA_CIRCULOS=1.5;
int COLOR_CONCENTRIC_CIRCLE=#FF6911;

float COLOR_OPCIDAD_RELLENO=50;


float radioOriginal=75;

void setup() {

 
  frameRate(60);
  //size(1920, 1080);
  size(1080,1080);

  //displayDensity(2);
  fullScreen(P2D,1);
  centroX=width/2;
  centroY=height/2;
  
  colorMode(HSB, 360, 100, 100);
  COLOR_INNER_CIRCLE= color(191,100,100);
  background(0);


  ///Color y Grosor Circulos Exteriores
  stroke(COLOR_OUTER_CIRCLE);
  strokeWeight(GROSOR_LINEA_CIRCULOS);


  //Cargamos Audio
  minim = new Minim(this);
  song = minim.loadFile("03_Train_Sound.mp3");
  song.play();
  song.loop();

  //Cargamos el FFT analysis
  fftLog  =  new FFT( song.bufferSize(), song.sampleRate() );


  ///Inicializaciones
  miCirculoOrigen=new CirculosConcent(new Circulos(centroX, centroY, radioOriginal, 0), NUM_CIRCULOS_INTERIORES);
  listaC.add(miCirculoOrigen);
  RADIO_ACUMULADO+=radioOriginal;
  float VELOCIDAD=180;

  for (int i=1; i<NUM_CIRCULOS_CONCENT; i++) {
    float radioAleatorio=random(radioOriginal/5, radioOriginal);

    miCirculoOrigenlinea2=new CirculosConcent(new Circulos(RADIO_ACUMULADO+radioAleatorio, 0.0, radioAleatorio, radians(VELOCIDAD/i)), NUM_CIRCULOS_INTERIORES);

    listaC.add(miCirculoOrigenlinea2);
    RADIO_ACUMULADO+=radioAleatorio*2;
  }
  //Inicializar el generador Aleatorio
  generator= new Random();
}

void draw() {


  //analizAudio();
  
  //println("Level: "+song.left.level()); 
  if ((song.left.level() > 0.5)  ) {
    
      int cambio= round(random(0,1));
      COLOR_INNER_CIRCLE = color( random(0,360), random(50,100), random(50,100));
      NUM_CIRCULOS_INTERIORES = (int)random(1,5);
      NUM_CIRCULOS_CONCENT = (int)random(1,11);
      //println("num_circulos: "+NUM_CIRCULOS_INTERIORES);
      reinicia();
      if (cambio==1)
        sentido=true;
      else
        sentido=false;
      
  } 
  dibujaCirculos();
}


void reinicia(){
 
  
  RADIO_ACUMULADO=0;
  
  listaC.clear();
  
 ///Inicializaciones
  miCirculoOrigen=new CirculosConcent(new Circulos(centroX, centroY, radioOriginal, 0), NUM_CIRCULOS_INTERIORES);
  listaC.add(miCirculoOrigen);
  RADIO_ACUMULADO+=radioOriginal;
  float VELOCIDAD=180;

  for (int i=1; i<NUM_CIRCULOS_CONCENT; i++) {
    float radioAleatorio=random(radioOriginal/5, radioOriginal);

    miCirculoOrigenlinea2=new CirculosConcent(new Circulos(RADIO_ACUMULADO+radioAleatorio, 0.0, radioAleatorio, radians(VELOCIDAD/i)), NUM_CIRCULOS_INTERIORES);

    listaC.add(miCirculoOrigenlinea2);
    RADIO_ACUMULADO+=radioAleatorio*2;
  }

}


void dibujaCirculos() {

  background(0);
  smooth();
  pushMatrix();
  stroke(COLOR_OUTER_CIRCLE);
  noFill();
  ellipseMode(CENTER);
  translate(listaC.get(0).origen.posX, listaC.get(0).origen.posY);
  //ellipse(0,0,listaC.get(0).origen.diametro,listaC.get(0).origen.diametro);
  listaC.get(0).origen.diametro=RuidoGauss(listaC.get(0).origen.diametro);
  ellipse(0, 0, listaC.get(0).origen.diametro, listaC.get(0).origen.diametro);

  for (Circulos o : listaC.get(0).listaCirculos) {
    pushMatrix();
    listaC.get(0).calculaCentroRuido(o);
    pushStyle();
    rotate(o.angulo);
    stroke(COLOR_INNER_CIRCLE);
    blendMode(BLEND);
    fill(COLOR_INNER_CIRCLE, COLOR_OPCIDAD_RELLENO*random(1, 2));
    strokeWeight(GROSOR_LINEA_CIRCULOS+0.5);
    ellipse(o.posX, o.posY, o.diametro, o.diametro);
    popStyle();
    o.angulo+=o.vel;
    popMatrix();
  }
  stroke(COLOR_OUTER_CIRCLE);
  for (int i=1; i<listaC.size(); i++) {
    listaC.get(i).RADIO_TOTAL=RuidoGauss(listaC.get(i).RADIO_TOTAL);
    listaC.get(i).origen.posX=listaC.get(i).RADIO_TOTAL-listaC.get(i).origen.radio;
    ellipse(0, 0, listaC.get(i).RADIO_TOTAL*2, listaC.get(i).RADIO_TOTAL*2);
  }

  for (int i=1; i<listaC.size(); i++) {
    pushMatrix();
    pushStyle();
    stroke(COLOR_OUTER_CIRCLE);
    strokeWeight(GROSOR_LINEA_CIRCULOS+1);

    rotate(listaC.get(i).origen.angulo);

    ellipse(listaC.get(i).origen.posX, listaC.get(i).origen.posY, listaC.get(i).origen.diametro, listaC.get(i).origen.diametro);
    popStyle();

    if (i%2==0) {
      if (sentido)
        listaC.get(i).origen.angulo+=radians(listaC.get(i).origen.vel);
      else
        listaC.get(i).origen.angulo-=radians(listaC.get(i).origen.vel);
    } else {
      if (sentido)
        listaC.get(i).origen.angulo-=radians(listaC.get(i).origen.vel);
      else
        listaC.get(i).origen.angulo+=radians(listaC.get(i).origen.vel);
    }



    pushMatrix();
    ellipseMode(CENTER);
    translate(listaC.get(i).origen.posX, listaC.get(i).origen.posY);
    
    for (Circulos o : listaC.get(i).listaCirculos) {
      
      pushMatrix();
      pushStyle();
      stroke(COLOR_INNER_CIRCLE);

      blendMode(BLEND);
    
      fill(COLOR_INNER_CIRCLE, COLOR_OPCIDAD_RELLENO*random(1, 2));
      strokeWeight(GROSOR_LINEA_CIRCULOS+0.5);

      rotate(o.angulo);
      ellipse(o.posX, o.posY, o.diametro, o.diametro);

      popStyle();
      o.angulo+=o.vel;

      popMatrix();
    }
    popMatrix();
    popMatrix();
  }

  popMatrix();

  //recordVideo();
}





void keyPressed() {
  if (sentido)
    sentido=false;
  else
    sentido=true;
}

float analizAudio() {

  fftLog.forward(song.mix);

  return fftLog.getBandWidth();
}

float RuidoGauss(float radioSinMov) {


  float h = (float)generator.nextGaussian();

  //println(h);
  h = h * analizAudio();
  h*=0.035; //Desviación Estandar. Hacemos la campan más ancha
  h+=radioSinMov; //Añadimos la media para desplazarla

  return h;
  //ellipse(width/2, height/2, h, h);
}
