class pixel{
 float x;
 float y;
 float valor;
 float nextValor;
 float valorA;
 float nextValorA;
 pixel(float xpos, float ypos){
   x=xpos;
   y=ypos;
   valor=0; //random(0,1);
   valorA=0; //random(0,1);
   nextValor = 0;
   nextValorA = 0;
 }
 
 void mostra(){
  fill(0,valorA*255,valor*255);
  rect(x,y,largura,largura);
 }
}
