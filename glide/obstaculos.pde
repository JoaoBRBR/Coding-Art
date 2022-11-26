
class obstaculo{
 float x, y, s,alfa;
 
  obstaculo(float g){
   x = random(width);
   y = random(height);
   s = random(10,50);
   alfa = g;
  }
  
  void desenha(){
   rect(x,y,s,s);
   x -= vh/alfa;
   y += angleD/alfa;
    if (x < -s || y < -s){
     x = width;
     y = random(2*height);
    }
  }
  
}
