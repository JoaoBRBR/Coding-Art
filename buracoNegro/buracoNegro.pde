PVector blackHole = new PVector(250, 250);
PVector bolaPos = new PVector(490, 40);
PVector bolaDir = new PVector(-1, 0);
float g = 30;
float m = 100;
int total = 300;

part[] ponto = new part[total];

int x = 800;
int y = 50;
int t = 50; 

void setup() {
  size(displayWidth, displayHeight);
  
  noStroke();
  for (int i=0; i< total; i++) {
    ponto[i] = new part(random(x,x+t),random(y,y+t), -1,0);
  }
  
}

void draw() {
  blackHole.x=mouseX;
  blackHole.y=mouseY;
  background(0);
  for (int i=0; i< total; i++) {
    PVector grav = new PVector(blackHole.x - ponto[i].x, blackHole.y - ponto[i].y);
    grav.normalize();
    float r = dist(blackHole.x, blackHole.y, ponto[i].x, ponto[i].y);
    grav.mult((g*m)/(r*r));
    //grav.limit(0.01);
    //grav.setMag(sq(dist(blackHole.x, blackHole.y, ponto[i].xv, ponto[i].yv))/(g*m));
    if (r<20) {
      ponto[i].xv=0;
      ponto[i].yv=0;
    } else {
      ponto[i].xv+=grav.x;
      ponto[i].yv+=grav.y;
      ponto[i].x+=ponto[i].xv;
      ponto[i].y+=ponto[i].yv;
    }
    fill(255);
    circle(ponto[i].x, ponto[i].y, 4);
  }
  fill(255, 0, 0);
  circle(blackHole.x, blackHole.y, 20);
}


class part {
  float x;
  float y;
  float xv;
  float yv;
  part(float posx, float posy, float velx, float vely) {
    x=posx;
    y=posy;
    xv=velx;
    yv=vely;
  }
}


//PVector grav = new PVector(blackHole.x - bolaPos.x, blackHole.y - bolaPos.y);
//grav.normalize();
//grav.div(dist(blackHole.x, blackHole.y, bolaPos.x, bolaPos.y) / g);
//bolaDir.add(grav);
