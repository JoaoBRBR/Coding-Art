PVector a = new PVector(100, 100);
PVector av = new PVector(0, 0);
PVector b = new PVector(400, 400);
PVector bv = new PVector(0, 0);
int v = 4;
float r = 100;
void setup() {
  size(500, 500);
  av = PVector.random2D();
  bv = PVector.random2D();
  av.setMag(v);
  bv.setMag(v);
}

void draw() {
  background(0);
  a.add(av);
  b.add(bv);
  colideParede();
  colideDois();
  desenha();
}

void colideDois() {
  if (dist(a.x, a.y, b.x, b.y)<r) {
    PVector nova = new PVector(b.x-a.x, b.y-a.y);
    av.set(nova);
    av.setMag(v);
    bv.set(nova);
    bv.setMag(v);
    av.x = -av.x;
    av.y = -av.y;
  }
}

void desenha() {
  circle(a.x, a.y, r);
  circle(b.x, b.y, r);
}

void colideParede() {
  if (a.x>500 || a.x<0) {
    av.x*=-1;
  }
  if (b.x>500 || b.x<0) {
    bv.x*=-1;
  }
  if (a.y>500 || a.y<0) {
    av.y*=-1;
  }
  if (b.y>500 || b.y<0) {
    bv.y*=-1;
  }
}
