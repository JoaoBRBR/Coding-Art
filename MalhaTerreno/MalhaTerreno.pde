import peasy.*;
PeasyCam camera;

int coluna, linha;
int escala=20;
float[][] elevar;
float[][] elevor;
int w=500;
int h=500;
float mover=0;
void setup() {

  size(displayWidth, displayHeight, P3D);
  coluna=w/escala;
  linha=h/escala;
  camera = new PeasyCam(this, 0, 0, 0, 500);
  elevar=new float[coluna][linha];
  elevor=new float[coluna][linha];
}

void draw() {
  mover+=0.05;
  float yof=mover;
  for (int y=0; y<linha; y++) {
    float xof=0;
    for (int x=0; x<coluna; x++) {
      elevar[x][y]=map(noise(xof, yof), 0, 1, -200, 10);
      elevor[x][y]=map(noise(xof+70, yof+70), 0, 1, -10,200);
      xof+=0.1;
    }
    yof+=0.1;
  }
  
  
  background(0);
  //lights();
  
  
  stroke(0,0,255);
  fill(0,0,100);
  for (int y=0; y<linha-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x=0; x<coluna; x++) {
      vertex((x*escala)-(w/2), (y*escala)-(w/2), elevar[x][y]);
      vertex((x*escala)-(w/2), ((y+1)*escala)-(w/2), elevar[x][y+1]);
    }
    endShape();
  }
  
  stroke(255,0,255);
  fill(100,0,100);
  for (int y=0; y<linha-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x=0; x<coluna; x++) {
      vertex((x*escala)-(w/2), (y*escala)-(w/2), elevor[x][y]);
      vertex((x*escala)-(w/2), ((y+1)*escala)-(w/2), elevor[x][y+1]);
    }
    endShape();
  }
}
