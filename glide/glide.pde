float angleD = 0;
float ya = 100;
float a = 90;
float xa = 100;
float px=100,
  py=250;
float angleV = 1;
int qnt = 10;
int qntA=20;
float vh=3;

obstaculo[] quadrado = new obstaculo[qnt];
obstaculo[] fundo = new obstaculo[qntA];
obstaculo[] fundoF = new obstaculo[qntA];

void setup() {
  size(500, 500);
  strokeWeight(3);
  stroke(255);
  noFill();
  ///
  ///
  for (int i=0; i<qnt; i++) {
    quadrado[i] = new obstaculo(1);
  }
  for (int i=0; i<qntA; i++) {
    fundo[i] = new obstaculo(2);
    fundoF[i] = new obstaculo(3);
  }
}

void draw() {
  background(0);
  apertaBtn();
  stroke(0,50,0);
  for (int i=0; i<qntA; i++) {
    fundoF[i].desenha();
  }
  stroke(0,100,0);
  for (int i=0; i<qntA; i++) {
    fundo[i].desenha();
  }
  stroke(255,0,0);
  for (int i=0; i<qnt; i++) {
    quadrado[i].desenha();
  }
  stroke(0,0,255);
  desenhaLinha();
  

  angleD = map(a, 0, 90, 0, -5);

  if (a>90) {
    a = 90;
  } else if (a<-90) {
    a = -90;
  }
  if(a>0){
  vh = map(a, 0, 90, 5, 0);
  }else if(a<0){
    vh = map(a, -90, 0, 0, 5);
  }
}

void desenhaLinha() {
  ya = sin(radians(a))*20;
  xa = cos(radians(a))*20;
  line(px-xa, py-ya, px+xa, py+ya);
  line(px-xa-4, py-ya-4, px+xa, py+ya);
}

void apertaBtn() {
  if (!keyPressed) {
    a+=angleV;
  } else {
    if (keyCode == UP) {
      a-=angleV;
    }
  }
}
