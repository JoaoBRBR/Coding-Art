float g = 0.1;
int quant=7;
bolas[] bola=new bolas[quant];

void setup() {
  size(900, 500);
  colorMode(HSB);

  for (int i = 0; i<quant; i++) {
    bola[i] = new bolas();
  }
}

void draw() {
  background(200);
  for (int i = 0; i<quant; i++) {
    bola[i].desenha();
    bola[i].colisao();
  }
}



class bolas {
  int mass;
  float x, y, xv, yv;
  float col;
  float mv;
  bolas() {
    mv= 10;
    col = int(random(400));
    mass=int(random(9, 60));
    x=width/2;
    xv=random(-mv, mv);
    y=height/2;
    yv=random(-mv, mv);
  }

  void desenha() {
    yv+=g*(map(mass, 9, 60, 1, 2));
    x+=xv;
    y+=yv;
    fill(col, 360, 360);
    circle(x, y, mass);
    
    if (yv<0.1 && y > height-2 ) {
      mv= 10;
      col = random(360);
      mass=int(random(10, 50));
      x=random(0, width);
      xv=random(-mv, mv);
      y=random(0, height);
      yv=random(-mv, mv);
    }
  }
  void colisao() {
    if (x>width) {
      x=width-1;
      xv*=-1;
      xv++;
    } else if (x<0) {
      x=1;
      xv*=-1;
      xv--;
    }

    if (y>height) {
      y=height-1;
      yv*=-1;
      yv++;
    }
  }
}
