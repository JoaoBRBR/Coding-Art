int q = 200;
float vel = 0.01;
gota[] gotas = new gota[q];

void setup(){
 size(displayWidth,displayHeight);
 for(int i=0;i<q;i++){
   gotas[i]= new gota();
 }
}

void draw(){
  background(0);
  for(int i=0;i<q;i++){
   gotas[i].cai();
   gotas[i].desenha();
 }
}
