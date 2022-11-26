PImage girl;
int r=15;
int d=15;
void setup() {
  size(900,600);
  girl = loadImage("girl.png");
  noStroke();
  background(255);
}

float x=random(width);
float y=random(height);

void draw(){
 
 //tint(100); //muda intencidade da imagem
 //image(girl,0,0);
 x=random(x-r,x+r);
 y=random(y-r,y+r);
 if(x>width){
  x=2; 
 }
 if(x<0){
  x=width-2; 
 }
 if(y>height){
  y=2; 
 }
 if(y<0){
  y=height-2; 
 }
 color c=girl.get(int(x),int(y));
 fill(c);
 ellipse(x,y,d,d);
}
