float a = 1.3;
float ver=18,ori=26;
float volta=8;
float[] escada = {
  15.5, 26.7,
  20.5, 27.5,
  15.3, 26.9,
  18, 27,
  15.5, 24.5,
  16.5, 24.7,
  16.9, 29,
  18.5, 26.7,
  19, 28,
  16.3, 27.5,
  18.5, 27,
  18.5, 28.3,
  15.2, 28.5,
  18.5, 26.9,
  16, 25,
  22.7, 60};
void setup(){
  size(800,600);
  for(int i=0;i<escada.length;i++){
    escada[i]*=a;
  }
}

void draw(){
  background(255);
  textSize(30);
  fill(0);
  text(ori/a,400,100);
  text(ver/a,500,100);
  ori=map(mouseX,width,0,5,30);
  ver=map(mouseY,height,0,5,30);
  ver*=a;
  ori*=a;
  float x=650,y=550,sx=650+(volta*a),sy=550;
  text(volta,500,height-50);
  stroke(255,0,0);
  strokeWeight(1);
  line(x,y,width,y);
  for(int i=0; i<escada.length;i+=2){
    line(x,y,x,y-escada[i]);
    line(x,y-escada[i],x-escada[i+1],y-escada[i]);
    x-=escada[i+1];
    y-=escada[i];
  }
  stroke(0,255,0);
  for(int i=0; i<escada.length/2;i++){
    line(sx,sy,sx,sy-ver);
    line(sx,sy-ver,sx-ori,sy-ver);
    sx-=ori;
    sy-=ver;
  }
}
