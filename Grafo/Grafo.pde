int total = 40;
int minDis = 150;

nos[] ponto = new nos[total];

void setup() {
  size(900, 500);
  for (int i = 0; i< total-1; i++) {
    ponto[i] = new nos();
  }
  noStroke();
}

void draw() {
  background(50);
  fill(100, 100, 255);
  for (int i = 0; i< total-1; i++) {
    ponto[i].anda();
    ponto[i].linha();
  }
}

class nos {
  float x;
  float y;
  float xv;
  float yv;
  float d;
  nos() {
    x = random(0, width);
    y = random(0, height);
    xv = random(-2, 2);
    yv = random(-2, 2);
    d = random(1, 3);
  }
  void anda() {
    x+=xv;
    y+=yv;
    if (x>width || x<0) {
      xv*=-1;
    }
    if (y>height || y<0) {
      yv*=-1;
    }
    circle(x, y, d);
  }
  void linha() {
    for (int i = 0; i< total-1; i++) {
      if (dist(x, y, ponto[i].x, ponto[i].y) < minDis) {
        float c = map(dist(x, y, ponto[i].x, ponto[i].y), minDis, 10, 0, 100);
        stroke(255,255,255,c);
        strokeWeight(1);
        line(x, y, ponto[i].x, ponto[i].y);
      }
    }
  }
}
