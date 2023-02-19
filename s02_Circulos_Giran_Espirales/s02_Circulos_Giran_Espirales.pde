import java.util.Random;

Circulos cir;
CirculosConcent miCirculoOrigen, miCirculoOrigenlinea2;
int NUM_CIRCULOS_INTERIORES=3;
int NUM_CIRCULOS_CONCENT=5;
float INCREMENTO_AN=0.03;
float centroX=width/2;
float centroY=height/2;




void setup() {
    frameRate(30);
    size(1920, 1080);
    centroX=width/2;
    centroY=height/2;
    background(0);
    stroke(250);
    //cir=new Circulos(width/2, height/2, 100);
    miCirculoOrigen=new CirculosConcent(new Circulos(centroX, centroY, 100),NUM_CIRCULOS_INTERIORES);
    
  
    
     miCirculoOrigenlinea2=new CirculosConcent(new Circulos(200, 0, 100),NUM_CIRCULOS_INTERIORES);
    
    
}

void draw() {
    // cir.display();
    // background(0);
    // noLoop();
    
    //delay(100);



    
        background(0);
        pushMatrix();
        noFill();
        ellipseMode(CENTER);
        translate(miCirculoOrigen.origen.posX, miCirculoOrigen.origen.posY);
        
        ellipse(0,0,miCirculoOrigen.origen.diametro,miCirculoOrigen.origen.diametro);
        for (Circulos o : miCirculoOrigen.listaCirculos) { 
            rotate(o.angulo);
            ellipse(o.posX, o.posY, o.diametro, o.diametro);
            o.angulo+=INCREMENTO_AN;
            // println(o.nom,o.angulo);
        }
        popMatrix();


        pushMatrix();
        ellipseMode(CENTER);
        translate(miCirculoOrigen.origen.posX, miCirculoOrigen.origen.posY);
        
        rotate(miCirculoOrigenlinea2.origen.angulo);
        ellipse(miCirculoOrigenlinea2.origen.posX, miCirculoOrigenlinea2.origen.posY, miCirculoOrigenlinea2.origen.diametro, miCirculoOrigenlinea2.origen.diametro);
        println(miCirculoOrigenlinea2.origen.posX, miCirculoOrigenlinea2.origen.posY);
        miCirculoOrigenlinea2.origen.angulo+=INCREMENTO_AN;
            //println(miCirculoOrigenlinea2.origen.angulo);
        

        pushMatrix();
        ellipseMode(CENTER);
        translate(miCirculoOrigenlinea2.origen.posX, miCirculoOrigenlinea2.origen.posY);
        //ellipse(miCirculoOrigenlinea2.origen.posX,miCirculoOrigenlinea2.origen.posY,miCirculoOrigenlinea2.origen.diametro,miCirculoOrigenlinea2.origen.diametro);
        for (Circulos o : miCirculoOrigenlinea2.listaCirculos) { 
            rotate(o.angulo);
            ellipse(o.posX, o.posY, o.diametro, o.diametro);
            o.angulo+=INCREMENTO_AN;
            // println(o.nom,o.angulo);
        }
        popMatrix();
        popMatrix();
        
    
}
