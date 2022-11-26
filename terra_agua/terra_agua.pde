import peasy.*;
PeasyCam camera;

int coluna, linha;
int escala=20;
float[][] elevar;
int w=2000;
int h=2000;
float mover=0;
void setup() {

  size(displayWidth, displayHeight, P3D);
  coluna=w/escala;
  linha=h/escala;
  camera = new PeasyCam(this, 0, 0, 0, 500);
  elevar=new float[coluna][linha];
}

void draw() {

  //mover+=0.05;
  float yof=mover;
  for (int y=0; y<linha; y++) {
    float xof=0;
    for (int x=0; x<coluna; x++) {
      elevar[x][y]=map(noise(xof, yof), 0, 1, -100, 100);
      xof+=0.1;
    }
    yof+=0.1;
  }


  background(100, 200, 250);
  lights();
  noStroke();
  fill(0, 100, 0);
  for (int y=0; y<linha-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x=0; x<coluna; x++) {
      vertex((x*escala)-(w/2), (y*escala)-(w/2), elevar[x][y]);
      vertex((x*escala)-(w/2), ((y+1)*escala)-(w/2), elevar[x][y+1]);
    }
    endShape();
  }

  fill(0, 0, 150);
  rect(-(w/2), -(w/2), w, w);
}
