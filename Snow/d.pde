class gota {
  float x, y, v, s, z;
  gota() {
    x=random(width);
    y=random(height);
    v=random(1, 5);
    s=random(-3, 3);
    z=map(v,1,5,3,9);
  }

  void cai() {
    y=y+v;
    x = x+(sin(radians(frameCount))*s);
    if (y > height) {
      x=random(width);
      y=0;
      v=random(1, 5);
      s=random(-3, 3);
    }
    v=v+vel;
    z=map(v,1,5,3,9);
  }
  void desenha(){
   stroke(255);
   strokeWeight(z);
   point(x,y); 
  }
  
}
