import peasy.*;

PeasyCam camera;

float[] xup;
float[] zup;

float[] xdown;
float[] zdown;

int upq=200;
int siz=500;
float v=0.5;

float abertura=50;

void setup(){
 size(500,500,P3D);
 xup=new float[upq];
 zup=new float[upq];
 
 xdown=new float[upq];
 zdown=new float[upq];
 
 for(int i=0;i<upq;i++){
 xup[i]=random(-siz,siz);
 zup[i]=random(-siz,siz);
 xdown[i]=random(-siz,siz);
 zdown[i]=random(-siz,siz);
 }
 
 camera = new PeasyCam(this, 0, 0, 0, 50);
}

void draw(){
  //translate(width/2,height/2);
  background(0);
  
  for(int i=0;i<upq;i++){
    strokeWeight(5);
    stroke(255,0,0);
    point(xup[i],abertura,zup[i]);
    stroke(0,0,255);
    point(xdown[i],-abertura,zdown[i]);
    //stroke(0,255,0,100);
    //strokeWeight(1);
    //line(xup[i],abertura,zup[i],xdown[i],-abertura,zdown[i]);
    zup[i]+=v;
    zdown[i]-=v;
    if(zup[i]>siz){
     zup[i] = -siz; 
    }
    if(zdown[i]<-siz){
     zdown[i] = siz; 
    }
  }
  stroke(255);
  strokeWeight(2);
  line(400,0,0,-400,0,0);
  line(0,400,0,0,-400,0);
  line(0,0,400,0,0,-400);
}
