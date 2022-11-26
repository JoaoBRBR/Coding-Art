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
        quadrado[i][j].valor=random(0,1);
        quadrado[i][j].valorA=random(0,1);
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
      quadrado[i][j].valorA=quadrado[i][j].nextValorA;
    }
  }
  delay(100);
}

void soma(int i, int j) {
  float total = 0;
  float totalA = 0;
  if (i!=0) {
    total += quadrado[i-1][j].valor;
    totalA += quadrado[i-1][j].valorA;
  }
  if (i!=grade-1) {
    total += quadrado[i+1][j].valor;
    totalA += quadrado[i+1][j].valorA;
  }
  if (j!=0) {
    total += quadrado[i][j-1].valor;
    totalA += quadrado[i][j-1].valorA;
  }
  if (j!=grade-1) {
    total += quadrado[i][j+1].valor;
    totalA += quadrado[i][j+1].valorA;
  }
  //if (i!=0 && j!=0) {
  //  total += quadrado[i-1][j-1].valor;
  //  totalA += quadrado[i-1][j-1].valorA;
  //}
  //if (i!=grade-1 && j!=grade-1) {
  //  total += quadrado[i+1][j+1].valor;
  //  totalA += quadrado[i+1][j+1].valorA;
  //}
  //if (i!=grade-1 && j!=0) {
  //  total += quadrado[i+1][j-1].valor;
  //  totalA += quadrado[i+1][j-1].valorA;
  //}
  //if (i!=0 && j!=grade-1) {
  //  total += quadrado[i-1][j+1].valor;
  //  totalA += quadrado[i-1][j+1].valorA;
  //}
  
  total=total/4;
  totalA=totalA/4;
  
  if(total > totalA){
   total-=0.01;
  }else if(total>totalA-0.001 &&  total<totalA+0.001){
   totalA=random(0,5);
   total=random(0,5);
  }else{
    
  }
  
  quadrado[i][j].nextValor = total;
  quadrado[i][j].nextValorA = totalA;
}
