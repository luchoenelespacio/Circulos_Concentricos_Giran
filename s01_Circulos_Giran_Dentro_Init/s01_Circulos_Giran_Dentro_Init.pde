import java.util.Random;

Circulos cir;
CirculosConcent miListaCirculos;
int NUM_CIRCULOS_INTERIORES=3;

void setup() {
    frameRate(30);
    size(800, 800);
    background(0);
    stroke(250);
    cir=new Circulos(width/2, height/2, 100);
    miListaCirculos=new CirculosConcent(cir,NUM_CIRCULOS_INTERIORES);
}

void draw() {
    // cir.display();
    // background(0);
    // noLoop();
    miListaCirculos.display();
    //delay(100);
}
