class pixel{
 float x;
 float y;
 int valor;
 int nextValor;
 pixel(float xpos, float ypos){
   x=xpos;
   y=ypos;
   if(random(10)<4){
     valor=floor(random(0,2));
   }else{
      valor=0;
   }
   nextValor = 0;
 }
 
 void mostra(){
  fill(valor*255);
  rect(x,y,largura,largura);
 }
}
