//altere esses valores//
int grade = 200; //tamanho lateral da grade

int largura;  //largura dos pixeis por tela
pixel[][] quadrado = new pixel[grade][grade]; //gerar pixel para cada index da grade;

void setup() {
  size(600, 600); //manter valores iguais para largura e altuera
  background(255);
  rectMode(CENTER);
  noStroke();

  largura = width/grade;

  for (int i = 0; i<grade; i++) {
    for (int j = 0; j<grade; j++) {
      quadrado[i][j]= new pixel((i*largura)+largura/2, (j*largura)+largura/2);
    }
  }
}

void draw() {
  for (int i = 0; i<grade; i++) {
    for (int j = 0; j<grade; j++) {
      quadrado[i][j].mostra();
      soma(i, j);
    }
  }
  for (int i = 0; i<grade; i++) {
    for (int j = 0; j<grade; j++) {
      quadrado[i][j].valor=quadrado[i][j].nextValor;
    }
  }
  //delay(100);
}

void soma(int i, int j) {
  float total = 0;
  if (i!=0) {
    total += quadrado[i-1][j].valor;
  }
  if (i!=grade-1) {
    total += quadrado[i+1][j].valor;
  }
  if (j!=0) {
    total += quadrado[i][j-1].valor;
  }
  if (j!=grade-1) {
    total += quadrado[i][j+1].valor;
  }
  if (i!=0 && j!=0) {
    total += quadrado[i-1][j-1].valor;
  }
  if (i!=grade-1 && j!=grade-1) {
    total += quadrado[i+1][j+1].valor;
  }
  if (i!=grade-1 && j!=0) {
    total += quadrado[i+1][j-1].valor;
  }
  if (i!=0 && j!=grade-1) {
    total += quadrado[i-1][j+1].valor;
  }
  //if (total > 1) {
  //  total = 0;
  //}
  total=total/8;
  quadrado[i][j].nextValor = total;
}
