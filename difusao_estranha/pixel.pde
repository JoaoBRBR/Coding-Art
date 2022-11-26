class pixel{
 float x;
 float y;
 float valor;
 float nextValor;
 pixel(float xpos, float ypos){
   x=xpos;
   y=ypos;
   //if(random(1)<0.1){
   //  valor=random(0,1);
   //}else{
   //  valor=0;
   //}
    valor=random(0,1);
   nextValor = 0;
 }
 
 void mostra(){
  fill(0,0,valor*255);
  rect(x,y,largura,largura);
 }
}
