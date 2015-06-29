import processing.opengl.*;

long timer=0;

int objnum=100;

backstrings[] strs=new backstrings[objnum];
String sg="Programming";
MainStr strn;
PFont font;

void setup(){
  size(800,600,OPENGL);
  smooth();
  font=loadFont("Times-Roman-20.vlw");
  for(int i=0;i<objnum;i++){
    strs[i]=new backstrings();
  }
  strn=new MainStr(sg,"CourierNewPSMT-80.vlw",80,300,0);
  
  frameRate(60);
}

void draw(){
  
  background(0);
  /*
  camera(400,300,500,width/2,height/2,0,0,1,0);
  */
  camera(400,1000,100,width/2,height/2,0,0,1,0);
  
  if((timer)%5==0){
    for(int i=0;i<objnum;i++){
      strs[i].setnewrand();
    }
  }
  
  if(timer>=30){ 
  
    if(timer%10==0){
      strn.inccnt();
    }
  
    if(timer%30==0){
      strn.blinklast();
    }
  
    strn.disp();
  }
  
  
  for(int i=0;i<objnum;i++){
    strs[i].upgo();
    strs[i].drawthis();
  }

  timer++;
  
  
}
