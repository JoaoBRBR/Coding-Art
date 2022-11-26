import processing.serial.*; //importa biblioteca sereal

Serial porta; //inicia porta de comunicação

float a = 0;    //variaveis dos retangulos
float b = 0;
int velocidade = 3;

int rectHight = 60; //tamanho do palito
int rectDist = 30; //distancia da borda

//bolinha x
int bolaX = width/2;
int bolaVelocidadeX = 2;
//bolinha y
int bolaY = height/2;
int bolaVelocidadeY = 2;

void setup() {
  size(700, 400); //tamanho da tela
  porta = new Serial(this, "COM3", 9600); //configuração da comunicação
  porta.bufferUntil('\n');
}

void draw() {
  background(0,0,0); //fundo da tela RGB

  if (keyPressed) { //checando teclas
    if (key == 'w') {
      a = a - velocidade;
    } else if (key == 's') {
      a = a + velocidade;
    }
    if (keyCode == UP) {
      b = b - velocidade;
    } else if (keyCode == DOWN) {
      b = b + velocidade;
    }
  }

  //colisao dos palitos com o teto
  if (a<rectHight/2) {
    a=rectHight/2;
  } else if (a>height-(rectHight/2)) {
    a=height-(rectHight/2);
  }
  if (b<rectHight/2) {
    b=rectHight/2;
  } else if (b>height-(rectHight/2)) {
    b=height-(rectHight/2);
  }

  //colisao da bola na parede
  bolaX = bolaX + bolaVelocidadeX;
  if (bolaX > width || bolaX < 0) {
    bolaX = width/2;
    bolaY = height/2;
    bolaVelocidadeX = -bolaVelocidadeX;
    bolaVelocidadeY = -bolaVelocidadeY;
  }
  bolaY = bolaY + bolaVelocidadeY;
  if (bolaY > height || bolaY < 0) {
    bolaVelocidadeY = -bolaVelocidadeY;
  }
  
  //colisao da bola nos palitos
  if (bolaX < rectDist && bolaY>a-rectHight/2 && bolaY<a+rectHight/2){
    bolaVelocidadeX = -bolaVelocidadeX;
  }else if (bolaX > width-rectDist && bolaY>b-rectHight/2 && bolaY<b+rectHight/2){
    bolaVelocidadeX = -bolaVelocidadeX;
  }
  
  //linha
  stroke(255);
  line(width/2,0,width/2,height);
  
  //formas desenhadas
  rectMode(CENTER);
  circle(bolaX, bolaY, 20);
  rect(20, a, 10, rectHight);
  rect(width-20, b, 10, rectHight);
}

void serialEvent(Serial porta) {
  String dado = porta.readString();
  String[] dadoSepara = split(dado, ',');
  float[] valores = float(dadoSepara);
  a = map(valores[0], 0, 1023, 0, height);
  b = map(valores[1], 0, 1023, 0, height);
  porta.write('s');
}
